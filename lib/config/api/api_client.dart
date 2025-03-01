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
  String appBaseUrl = ApiConstantDev.urlApiServer;
  final SharedPreferences sharedPreferences;
  final String noInternetMessage = 'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;
  BaseDeviceInfo deiceInfo;
  final String uniqueId;
  String fcmToken = '';
  String bearerToken = '';
  String bearerTokenExpirationDate = '';
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
    bearerToken = sharedPreferences.getString(Constant.API_TOKEN) ?? "";
    bearerTokenExpirationDate = sharedPreferences.getString(Constant.API_TOKEN_EXPIRATION_DATE) ?? "";
    logCat('getApiToken() | bearerToken: $bearerToken | bearerTokenExpirationDate: $bearerTokenExpirationDate');
    updateHeader();
    return bearerToken;
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
  getData(String apiUrl, {String? fName, data}) async {
    var uriPath = Uri.parse(apiUrl);
    if (data != null) {
      uriPath = uriPath.replace(queryParameters: data.toJson());
    }
    logCat('URL: [GET]: $fName .::. $uriPath');
    var response = await http.get(uriPath, headers: _mainHeaders);
    logCat(
        'URL: [GET]: $fName .::. $uriPath :: statusCode: ${response.statusCode}');
    return response;
  }

  postData({required String apiUrl, String? fName, data}) async {
    logCat('URL: [POST]: $fName .::. $apiUrl');
    dynamic response;
    if (data != null) {
      response = await http.post(Uri.parse(apiUrl),
          body: jsonEncode(data), headers: _getHeaders());
    } else {
      response = await http.post(Uri.parse(apiUrl), headers: _getHeaders());
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
          body: jsonEncode(data), headers: _getHeaders());
    } else {
      response = await http.put(Uri.parse(apiUrl), headers: _getHeaders());
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
          body: jsonEncode(data), headers: _getHeaders());
    } else {
      response = await http.patch(Uri.parse(apiUrl), headers: _getHeaders());
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
          body: jsonEncode(data), headers: _getHeaders());
    } else {
      response = await http.delete(Uri.parse(apiUrl), headers: _getHeaders());
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
