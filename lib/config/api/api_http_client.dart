// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiHttpClient {
  String token = '';

  //String urlApi='';
  //static String urlApiLGDC = '${ApiConstant.urlApiLGDC}/';
  ApiHttpClient() {
    //setPackageInfo
  }

  setPackageInfo(PackageInfo package) {
    //packageInfo = package;
  }

  //region [ FcmToken ]
  Future<String> getFcmToken() async {
    String fcmToken = ''; //sharedPreferences.getString(Constant.TOKEN) ?? "";
    logCat('getFcmToken :$fcmToken');
    if (fcmToken == "") {
      // fcmToken = await firebaseMessaging.getToken()??'';
      // logCat('get.FCM Token :$fcmToken');
      // setFcmToken( fcmToken );
    }
    return fcmToken;
  }

  setFcmToken(String fcmToken) async {
    logCat('set FcmToken: $fcmToken');
    //sharedPreferences.setString(Constant.TOKEN, fcmToken);
  }

  //endregion

  //region [ FcmToken ]
  /*Future<String> getDeviceId() async {
    String deviceId = await sharedPreferences.getString(Constant.DEVICE_ID) ?? "";
    DeviceInfoModel deviceInfo = DeviceInfoModel.convertFromJson(deiceInfo.data);
    logCat('get DeviceId :$deviceId');
    if( deviceId==""){
      deviceId = deviceInfo.identifierForVendor;
    }
    if( deviceId==""){
      deviceId = uniqueId;
      logCat('NEW  DeviceId :$uniqueId');
      setDeviceId( uniqueId );
    }
    return deviceId;
  }*/
  setDeviceId(String deviceId) async {
    logCat('set NEW DeviceId: $deviceId');
    //sharedPreferences.setString(Constant.DEVICE_ID, deviceId);
  }

  //endregion

  //region [ ApiToken ]
  // Future<String> getApiToken() async {
  //   // bearerToken = sharedPreferences.getString(Constant.API_TOKEN) ?? "";
  //   // bearerTokenExpirationDate = sharedPreferences.getString(Constant.API_TOKEN_EXPIRATION_DATE) ?? "";
  //   // updateHeader();
  //   // return bearerToken;
  // }

  setApiToken(String apiToken) async {
    // bearerToken=apiToken;
    // bearerTokenExpirationDate = Constant.format_yyyyMMdd.format(DateTime.now().add(Duration(days: 90)));
    // sharedPreferences.setString(Constant.API_TOKEN, apiToken);
    // sharedPreferences.setString(Constant.API_TOKEN_EXPIRATION_DATE, bearerTokenExpirationDate);
    // updateHeader();
  }

  //endregion

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token') != null
        ? jsonDecode(localStorage.getString('token') ?? '')['token']
        : '';
  }

  postDataWithData({apiUrl, data, String? fName}) async {
    logCat('URL: [POST]: $fName .::. $apiUrl');
    var response = await http.post(Uri.parse(apiUrl),
        body: jsonEncode(data), headers: _setHeaders());
    logCat(
        'URL: [POST]: $fName .::. $apiUrl :: statusCode: ${response.statusCode}');
    return response;
  }

  // getData2(endpoint) async {
  //   await _getToken();
  //   urlApi = urlApiLGDC + endpoint;
  //   logCat('getData :: urlApi: $urlApi');
  //   var response =  await http.get(Uri.parse(urlApi), headers: _setHeaders());
  //   logCat('URL: $apiEndpointUrl :: statusCode: ${response.statusCode}');
  //   return response;
  // }

  var mainHeadersSimple = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  postDataWithOutBearer(
      {required String apiUrl,
      Map<String, dynamic>? data,
      String? fName}) async {
    //await getApiToken();
    logCat('URL: [POST]: $fName .::. $apiUrl');
    var response = await http.post(Uri.parse(apiUrl),
        body: jsonEncode(data), headers: mainHeadersSimple);
    logCat(
        'URL: [POST]: $fName .::. $apiUrl :: statusCode: ${response.statusCode}');
    return response;
  }

  postData(String apiEndpointUrl, {String? fName}) async {
    logCat('URL: [POST]: $fName .::. $apiEndpointUrl');
    var response =
        await http.post(Uri.parse(apiEndpointUrl), headers: _setHeaders());
    logCat(
        'URL: [POST]: $fName .::. $apiEndpointUrl :: statusCode: ${response.statusCode}');
    return response;
  }

  putData(String apiEndpointUrl, {String? fName}) async {
    logCat('URL: [PUT]: $fName .::. $apiEndpointUrl');
    var response =
        await http.put(Uri.parse(apiEndpointUrl), headers: _setHeaders());
    logCat(
        'URL: [PUT]: $fName .::. $apiEndpointUrl :: statusCode: ${response.statusCode}');
    return response;
  }

  deleteData(String apiEndpointUrl, {String? fName}) async {
    logCat('URL: [DELETE]: $fName .::. $apiEndpointUrl');
    var response =
        await http.delete(Uri.parse(apiEndpointUrl), headers: _setHeaders());
    logCat(
        'URL: [DELETE]: $fName .::. $apiEndpointUrl :: statusCode: ${response.statusCode}');
    return response;
  }

  getData(String apiEndpointUrl, {String? fName}) async {
    //await _getToken();
    logCat('URL: [GET]: $fName .::. $apiEndpointUrl');
    var response =
        await http.get(Uri.parse(apiEndpointUrl), headers: _setHeaders());
    logCat(
        'URL: [GET]: $fName .::. $apiEndpointUrl :: statusCode: ${response.statusCode}');
    return response;
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
