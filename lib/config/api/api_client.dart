// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:brain_dev_tools/models/security/device_info_model.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_checker.dart';
import 'api_constant.dart';

class ApiClient extends GetxService {
  String appBaseUrl = ApiConstantDev.urlMiddleware;
  final SharedPreferences sharedPreferences;
  final String noInternetMessage = 'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;
  BaseDeviceInfo deiceInfo;
  final String uniqueId;
  String fcmToken = '';
  String bearerToken = '';
  String bearerTokenExpirationDate = '';

  /// Fournisseur externe du jeton d'accès (ex. Keycloak, voir `brain_dev_keycloak_login`).
  ///
  /// Renvoie le jeton d'accès BRUT (sans « Bearer »), renouvelé si nécessaire, ou `null` quand l'utilisateur n'est pas
  /// connecté. Quand il est défini, il remplace le jeton de l'ancienne API enregistré dans les préférences : chaque
  /// appel relit le jeton, donc un jeton qui expire (une heure avec Keycloak) n'est jamais envoyé périmé.
  Future<String?> Function()? accessTokenProvider;

  /// Vrai quand un fournisseur externe gère le jeton (l'ancienne authentification `auto-authenticate` est alors inutile).
  bool get hasExternalTokenProvider => accessTokenProvider != null;

  /// Hôtes (ex. `middleware.lyricstream.app`) auxquels le jeton externe et l'attestation sont envoyés.
  ///
  /// **Vide (défaut) : tous les hôtes**, comportement d'origine. Renseigné : les autres hôtes (l'ancienne API, tant que
  /// des routes y restent, comme le partage de chants) continuent de recevoir leur PROPRE jeton enregistré, et ne
  /// reçoivent ni le jeton Keycloak ni l'attestation (un serveur n'a pas à recevoir des jetons qui ne sont pas les siens).
  Set<String> externalAuthHosts = {};

  /// Vrai quand le fournisseur externe remplace AUSSI le jeton de l'ancienne API (aucun hôte précisé) : l'ancienne
  /// authentification `auto-authenticate` est alors inutile. Faux dès que des hôtes sont précisés : l'ancienne API
  /// garde son jeton.
  bool get externalTokenReplacesLegacy => accessTokenProvider != null && externalAuthHosts.isEmpty;

  bool _usesExternalAuth(String? url) {
    if (externalAuthHosts.isEmpty) return true;
    final host = url == null ? null : Uri.tryParse(url)?.host;
    return host != null && externalAuthHosts.contains(host);
  }

  /// Fournisseur du jeton d'ATTESTATION de l'application (Firebase App Check) : il prouve que l'appel vient de la vraie
  /// application sur un appareil authentique, même sans compte utilisateur. Le jeton est placé dans l'en-tête
  /// `X-Firebase-AppCheck` de chaque appel (en plus du jeton Keycloak quand l'utilisateur est connecté).
  /// Renvoie `null` si aucune attestation n'est disponible ; une erreur du fournisseur n'empêche jamais l'appel.
  Future<String?> Function()? attestationProvider;

  /// Dernier jeton d'attestation lu (vide si aucun).
  String appCheckToken = '';

  /// Nom de l'en-tête qui porte le jeton d'attestation (lu par `AccessGuard` du Middleware).
  static const String appCheckHeader = 'X-Firebase-AppCheck';
  Map<String, String> _mainHeaders = {};
  //final FirebaseMessaging firebaseMessaging;
  PackageInfo? packageInfo;

  ApiClient({
    //required this.firebaseMessaging,
    required this.appBaseUrl,
    required this.sharedPreferences,
    required this.deiceInfo,
    required this.uniqueId,
  }) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': bearerToken,
    };
    // logCat('ApiClient().::.FCMToken: $fcmToken');
    // logCat('ApiClient().::.BearerToken: $bearerToken');
    //
    // logCat('=========-----${deiceInfo.data.toString()}------=========');
    if ('${deiceInfo.data['isPhysicalDevice']}' == 'true') {
      // logCat('=========-----${deiceInfo.data.toString()}------=========');
      _mainHeaders.addAll({
        'device-id': uniqueId,
        'os': GetPlatform.isAndroid ? 'android' : 'ios',
        'device-model': '${deiceInfo.data['brand']} ${deiceInfo.data['model']}'
      });
    }
  }

  setPackageInfo(PackageInfo package) {
    packageInfo = package;
  }

  //region [ FcmToken ]
  // Future<String> getFcmToken() async {
  //   String fcmToken = sharedPreferences.getString(Constant.TOKEN) ?? "";
  //   logCat('getFcmToken :$fcmToken');
  //   if (fcmToken == "") {
  //     fcmToken = await firebaseMessaging.getToken() ?? '';
  //     logCat('get.FCM Token :$fcmToken');
  //     setFcmToken(fcmToken);
  //   }
  //   return fcmToken;
  // }
  //
  // setFcmToken(String fcmToken) async {
  //   logCat('set FcmToken: $fcmToken');
  //   sharedPreferences.setString(Constant.TOKEN, fcmToken);
  // }
  //endregion

  //region [ FcmToken ]
  String getDeviceId() {
    String deviceId = sharedPreferences.getString(Constant.DEVICE_ID) ?? "";
    DeviceInfoModel deviceInfo = DeviceInfoModel.fromJson(deiceInfo.data);
    logCat('get DeviceId :$deviceId');
    if (deviceId == "") {
      deviceId = deviceInfo.identifierForVendor;
    }
    if (deviceId == "") {
      deviceId = uniqueId;
      logCat('NEW  DeviceId :$uniqueId');
      setDeviceId(uniqueId);
    }
    return deviceId;
  }

  setDeviceId(String deviceId) async {
    logCat('set NEW DeviceId: $deviceId');
    sharedPreferences.setString(Constant.DEVICE_ID, deviceId);
  }
  //endregion

  //region [ ApiToken ]
  Future<String> getApiToken() async {
    await _refreshAttestation();
    final provider = accessTokenProvider;
    if (provider != null) {
      final accessToken = await provider();
      bearerToken = (accessToken == null || accessToken.isEmpty) ? '' : 'Bearer $accessToken';
      bearerTokenExpirationDate = '';
      updateHeader();
      return bearerToken;
    }
    bearerToken = sharedPreferences.getString(Constant.API_TOKEN) ?? "";
    bearerTokenExpirationDate = sharedPreferences.getString(Constant.API_TOKEN_EXPIRATION_DATE) ?? "";
    logCat('getApiToken() | bearerToken: $bearerToken | bearerTokenExpirationDate: $bearerTokenExpirationDate');
    updateHeader();
    return bearerToken;
  }

  Future<void> _refreshAttestation() async {
    final provider = attestationProvider;
    if (provider == null) {
      appCheckToken = '';
      return;
    }
    try {
      appCheckToken = (await provider()) ?? '';
    } catch (ex, trace) {
      // Pas d'attestation (réseau, service Google indisponible) : l'appel part sans, le serveur décidera.
      appCheckToken = '';
      logError(ex, trace: trace, position: 'ApiClient::_refreshAttestation');
    }
  }

  setApiToken(String apiToken) async {
    bearerToken = apiToken;
    bearerTokenExpirationDate = Constant.format_yyyyMMdd.format(DateTime.now().add(const Duration(days: 90)));
    sharedPreferences.setString(Constant.API_TOKEN, apiToken);
    sharedPreferences.setString(Constant.API_TOKEN_EXPIRATION_DATE, bearerTokenExpirationDate);
    updateHeader();
  }
  //endregion

  Future<bool> saveUserToken(String token) async {
    return await sharedPreferences.setString(Constant.TOKEN, token);
  }

  _getHeaders() => _mainHeaders;

  /// En-têtes à jour pour les verbes `getData`, `postData`, `putData`, `patchData` et `deleteData`, qui ne passaient pas
  /// par `getApiToken()` : avec un fournisseur externe, le jeton est relu (et renouvelé) avant chaque appel.
  Future<Map<String, String>> _getFreshHeaders({String? url}) async {
    if (!_usesExternalAuth(url)) {
      // Hôte hérité (ancienne API) : son propre jeton, rien d'externe. `bearerToken` n'est pas touché.
      return _buildHeaders(authorization: sharedPreferences.getString(Constant.API_TOKEN) ?? '');
    }
    if (externalAuthHosts.isNotEmpty) {
      return _externalHeaders();
    }
    if (accessTokenProvider != null || attestationProvider != null) {
      await getApiToken();
    }
    return _getHeaders();
  }

  /// En-têtes d'un hôte externe quand des hôtes sont précisés : jeton externe et attestation relus à chaque appel,
  /// sans écraser `bearerToken` (qui reste celui de l'ancienne API).
  Future<Map<String, String>> _externalHeaders() async {
    await _refreshAttestation();
    String authorization = '';
    final provider = accessTokenProvider;
    if (provider != null) {
      try {
        final token = await provider();
        authorization = (token == null || token.isEmpty) ? '' : 'Bearer $token';
      } catch (ex, trace) {
        logError(ex, trace: trace, position: 'ApiClient::_externalHeaders');
      }
    }
    return _buildHeaders(authorization: authorization, attestation: appCheckToken);
  }

  Map<String, String> _buildHeaders({required String authorization, String attestation = ''}) {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': authorization,
      if (attestation.isNotEmpty) appCheckHeader: attestation,
    };
    if ('${deiceInfo.data['isPhysicalDevice']}' == 'true') {
      headers.addAll({
        'device-id': uniqueId,
        'os': GetPlatform.isAndroid ? 'android' : 'ios',
        'device-model':
            '${GetPlatform.isAndroid ? '${deiceInfo.data['brand']} ${deiceInfo.data['device-model']}' : ''} ${deiceInfo.data['model']}'
      });
    }
    return headers;
  }
  var mainHeadersSimple = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  void updateHeader() {
    //({required String bearerToken}) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
      if (appCheckToken.isNotEmpty) appCheckHeader: appCheckToken,
    };
    //logCat('ApiClient():updateHeader().::.BearerToken: $bearerToken');

    if ('${deiceInfo.data['isPhysicalDevice']}' == 'true') {
      _mainHeaders.addAll({
        'device-id': uniqueId,
        'os': GetPlatform.isAndroid ? 'android' : 'ios',
        'device-model':
            '${GetPlatform.isAndroid ? '${deiceInfo.data['brand']} ${deiceInfo.data['device-model']}' : ''} ${deiceInfo.data['model']}'
      });
    }
  }

  //region [ VERBS / GET, POST, PUT, DELETE ]
  /// [extraHeaders] : en-têtes ajoutés à ceux de l'`ApiClient` pour cet appel seulement (ex. `If-None-Match`).
  getData(String apiUrl, {String? fName, data, Map<String, String>? extraHeaders}) async {
    var uriPath = Uri.parse(apiUrl);
    if (data != null) {
      uriPath = uriPath.replace(queryParameters: data.toJson());
    }
    logCat('URL: [GET]: $fName .::. $uriPath');
    // Copie : la carte de l'ApiClient est partagée, `extraHeaders` ne doit servir qu'à cet appel.
    final headers = Map<String, String>.from(await _getFreshHeaders(url: apiUrl));
    if (extraHeaders != null) headers.addAll(extraHeaders);
    var response = await http.get(uriPath, headers: headers);
    logCat(
        'URL: [GET]: $fName .::. $uriPath :: statusCode: ${response.statusCode}');
    return response;
  }

  postData({required String apiUrl, String? fName, data}) async {
    logCat('URL: [POST]: $fName .::. $apiUrl');
    dynamic response;
    if (data != null) {
      response = await http.post(Uri.parse(apiUrl),
          body: jsonEncode(data), headers: await _getFreshHeaders(url: apiUrl));
    } else {
      response = await http.post(Uri.parse(apiUrl), headers: await _getFreshHeaders(url: apiUrl));
    }
    logCat(
        'URL: [POST]: $fName .::. $apiUrl :: statusCode: ${response.statusCode}');
    return response;
  }

  putData({required String apiUrl, String? fName, data}) async {
    logCat('URL: [PUT]: $fName .::. $apiUrl');
    http.Response response;
    if (data != null) {
      response = await http.put(Uri.parse(apiUrl),
          body: jsonEncode(data), headers: await _getFreshHeaders(url: apiUrl));
    } else {
      response = await http.put(Uri.parse(apiUrl), headers: await _getFreshHeaders(url: apiUrl));
    }
    logCat(
        'URL: [PUT]: $fName .::. $apiUrl :: statusCode: ${response.statusCode}');
    return response;
  }

  patchData({required String apiUrl, String? fName, data}) async {
    logCat('URL: [PATCH]: $fName .::. $apiUrl');
    http.Response response;
    if (data != null) {
      response = await http.patch(Uri.parse(apiUrl),
          body: jsonEncode(data), headers: await _getFreshHeaders(url: apiUrl));
    } else {
      response = await http.patch(Uri.parse(apiUrl), headers: await _getFreshHeaders(url: apiUrl));
    }
    logCat(
        'URL: [PATCH]: $fName .::. $apiUrl :: statusCode: ${response.statusCode}');
    return response;
  }

  deleteData({required String apiUrl, String? fName, data}) async {
    logCat('URL: [DELETE]: $fName .::. $apiUrl');
    http.Response response;
    if (data != null) {
      response = await http.delete(Uri.parse(apiUrl),
          body: jsonEncode(data), headers: await _getFreshHeaders(url: apiUrl));
    } else {
      response = await http.delete(Uri.parse(apiUrl), headers: await _getFreshHeaders(url: apiUrl));
    }
    logCat(
        'URL: [DELETE]: $fName .::. $apiUrl :: statusCode: ${response.statusCode}');
    return response;
  }
  //endregion

  Future<Response> getData3(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    await getApiToken();
    if (await ApiChecker.isVpnActive()) {
      return const Response(statusCode: -1, statusText: 'you are using vpn');
    } else {
      try {
        logCat('====> API Call: $uri\nHeader: $_mainHeaders');
        logCat('====> API Call: $appBaseUrl$uri');
        String apiUrl = "$appBaseUrl$uri";
        http.Response response = await http
            .get(
              Uri.parse(apiUrl),
              headers: headers ?? _mainHeaders,
            )
            .timeout(Duration(seconds: timeoutInSeconds));
        return handleResponse(response, uri);
      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
      }
    }
  }

  Future<Response> getData4(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    await getApiToken();
    if (await ApiChecker.isVpnActive()) {
      return const Response(statusCode: -1, statusText: 'you are using vpn');
    } else {
      try {
        logCat('====> API Call: $uri\nHeader: $_mainHeaders');
        logCat('====> API Call: $appBaseUrl$uri');
        String apiUrl = "$appBaseUrl$uri";
        http.Response response = await http
            .get(
              Uri.parse(apiUrl),
              headers: headers ?? _mainHeaders,
            )
            .timeout(Duration(seconds: timeoutInSeconds));
        return handleResponse(response, uri);
      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
      }
    }
  }

  Future<Response> postData2(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    await getApiToken();
    if (await ApiChecker.isVpnActive()) {
      return const Response(statusCode: -1, statusText: 'you are using vpn');
    }
    {
      try {
        String apiUrl = appBaseUrl + uri;
        logCat('====> apiUrl: $apiUrl');
        logCat('====> GetX Base URL: $appBaseUrl');
        logCat('====> GetX Call: $uri');
        logCat('====> GetX Body: $body');
        http.Response response0 = await http
            .post(
              Uri.parse(apiUrl),
              body: jsonEncode(body),
              headers: headers ?? _mainHeaders,
            )
            .timeout(Duration(seconds: timeoutInSeconds));
        logCat("++++++++++++>>>=====");
        Response response = handleResponse(response0, uri);

        logCat(
            '====> API Response: [${response.statusCode}] $uri\n${response.body}');
        return response;
      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
      }
    }
  }

  Future<Response> postMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers}) async {
    await getApiToken();
    if (await ApiChecker.isVpnActive()) {
      return const Response(statusCode: -1, statusText: 'you are using vpn');
    }
    {
      try {
        if (foundation.kDebugMode) {
          logCat('====> API Call: $uri\nToken: $fcmToken');
          logCat('====> API Body: $body with ${multipartBody.length} image ');
        }
        http.MultipartRequest request =
            http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
        request.headers.addAll(headers ?? _mainHeaders);
        for (MultipartBody multipart in multipartBody) {
          if (foundation.kIsWeb) {
            Uint8List list = await multipart.file!.readAsBytes();
            http.MultipartFile part = http.MultipartFile(
              multipart.key,
              multipart.file!.readAsBytes().asStream(),
              list.length,
              filename: basename(multipart.file!.path),
              contentType: MediaType('image', 'jpg'),
            );
            request.files.add(part);
          } else {
            File file = File(multipart.file!.path);
            request.files.add(http.MultipartFile(
              multipart.key,
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path.split('/').last,
            ));
          }
        }
        request.fields.addAll(body);
        http.Response response0 =
            await http.Response.fromStream(await request.send());
        Response response = handleResponse(response0, uri);
        if (foundation.kDebugMode) {
          logCat(
              '====> API Response: [${response.statusCode}] $uri\n${response.body}');
        }
        return response;
      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
      }
    }
  }

  Future<Response> putData2(String uri, dynamic body,
      {Map<String, dynamic>? query,
      String contentType = '',
      Map<String, String>? headers,
      Function(dynamic)? decoder,
      Function(double)? uploadProgress}) async {
    if (await ApiChecker.isVpnActive()) {
      return const Response(statusCode: -1, statusText: 'you are using vpn');
    }
    {
      try {
        await getApiToken();
        logCat('====> GetX Call: $uri');
        logCat('====> GetX Body: $body');
        http.Response response0 = await http
            .put(
              Uri.parse(appBaseUrl + uri),
              body: jsonEncode(body),
              headers: headers ?? _mainHeaders,
            )
            .timeout(Duration(seconds: timeoutInSeconds));
        Response response = handleResponse(response0, uri);
        if (foundation.kDebugMode) {
          logCat(
              '====> API Response: [${response.statusCode}] $uri\n${response.body}');
        }
        return response;
      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
      }
    }
  }

  Future<Response> putMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers}) async {
    await getApiToken();
    if (await ApiChecker.isVpnActive()) {
      return const Response(statusCode: -1, statusText: 'you are using vpn');
    }
    {
      try {
        if (foundation.kDebugMode) {
          logCat('====> API Call: $uri\nToken: $fcmToken');
          logCat('====> API Body: $body');
        }
        http.MultipartRequest request =
            http.MultipartRequest('PUT', Uri.parse(appBaseUrl + uri));
        request.headers.addAll(headers ?? _mainHeaders);
        for (MultipartBody multipart in multipartBody) {
          if (foundation.kIsWeb) {
            Uint8List list = await multipart.file!.readAsBytes();
            http.MultipartFile part = http.MultipartFile(
              multipart.key,
              multipart.file!.readAsBytes().asStream(),
              list.length,
              filename: basename(multipart.file!.path),
              contentType: MediaType('image', 'jpg'),
            );
            request.files.add(part);
          } else {
            File file = File(multipart.file!.path);
            request.files.add(http.MultipartFile(
              multipart.key,
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path.split('/').last,
            ));
          }
        }
        request.fields.addAll(body);
        http.Response response0 =
            await http.Response.fromStream(await request.send());
        Response response = handleResponse(response0, uri);
        if (foundation.kDebugMode) {
          logCat(
              '====> API Response: [${response.statusCode}] $uri\n${response.body}');
        }
        return response;
      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
      }
    }
  }

  Future<Response> deleteData2(String uri,
      {Map<String, String>? headers}) async {
    await getApiToken();
    if (await ApiChecker.isVpnActive()) {
      return const Response(statusCode: -1, statusText: 'you are using vpn');
    }
    {
      try {
        logCat('====> API Call: $uri\nHeader: $_mainHeaders');
        http.Response response = await http
            .delete(
              Uri.parse(appBaseUrl + uri),
              headers: headers ?? _mainHeaders,
            )
            .timeout(Duration(seconds: timeoutInSeconds));
        return handleResponse(response, uri);
      } catch (e) {
        return Response(statusCode: 1, statusText: noInternetMessage);
      }
    }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'handleResponse');
    }
    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode != 200 &&
        response0.body != null &&
        response0.body is! String) {
      if (response0.body.toString().startsWith('{errors: [{code:')) {
        //ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        //response0 = Response(statusCode: response0.statusCode, body: response0.body, statusText: errorResponse.errors?[0].message);
      } else if (response0.body.toString().startsWith('{message')) {
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: response0.body['message']);
      }
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = Response(statusCode: 0, statusText: noInternetMessage);
    }
    logCat(
        '====> API Response: [${response0.statusCode}] $uri\n${response0.body}');
    return response0;
  }
}

class MultipartBody {
  String key;
  File? file;

  MultipartBody(this.key, this.file);
}
