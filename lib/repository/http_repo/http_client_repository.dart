// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpClientRepository {
  String token='';
  //String urlApi='';
  //static String urlApiLGDC = '${ApiConstant.urlApiLGDC}/';

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token') != null
        ? jsonDecode(localStorage.getString('token')??'')['token']
        : '';
  }

  postDataWithData({ apiUrl, data, String? fName }) async {
    logCat('URL: [POST]: $fName .::. $apiUrl');
    var response = await http.post(Uri.parse(apiUrl),
        body: jsonEncode(data), headers: _setHeaders());
    logCat('URL: [POST]: $fName .::. $apiUrl :: statusCode: ${response.statusCode}');
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
  postData( String apiEndpointUrl, {String? fName }) async {
    logCat('URL: [POST]: $fName .::. $apiEndpointUrl');
    var response =  await http.post(Uri.parse(apiEndpointUrl), headers: _setHeaders());
    logCat('URL: [POST]: $fName .::. $apiEndpointUrl :: statusCode: ${response.statusCode}');
    return response;
  }
  putData( String apiEndpointUrl, {String? fName }) async {
    logCat('URL: [PUT]: $fName .::. $apiEndpointUrl');
    var response =  await http.put(Uri.parse(apiEndpointUrl), headers: _setHeaders());
    logCat('URL: [PUT]: $fName .::. $apiEndpointUrl :: statusCode: ${response.statusCode}');
    return response;
  }
  deleteData( String apiEndpointUrl, {String? fName }) async {
    logCat('URL: [DELETE]: $fName .::. $apiEndpointUrl');
    var response = await http.delete(Uri.parse(apiEndpointUrl), headers: _setHeaders());
    logCat('URL: [DELETE]: $fName .::. $apiEndpointUrl :: statusCode: ${response.statusCode}');
    return response;
  }
  getData( String apiEndpointUrl, {String? fName } ) async {
    //await _getToken();
    logCat('URL: [GET]: $fName .::. $apiEndpointUrl');
    var response = await http.get(Uri.parse(apiEndpointUrl), headers: _setHeaders());
    logCat('URL: [GET]: $fName .::. $apiEndpointUrl :: statusCode: ${response.statusCode}');
    return response;
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}
