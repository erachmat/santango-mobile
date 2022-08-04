import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {

  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({ required this.appBaseUrl }) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstant.TOKEN;
    _mainHeaders = {
      'Content-type' : 'application/json',
      'Authorization' : 'Bearer $token',
      "x-api-key": "aG9tZXJlbnRhbDpiMXNtMWxsNGg=",
      "Accept": "application/json",
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type' : 'application/json',
      'Authorization' : 'Bearer $token',
      "x-api-key": "aG9tZXJlbnRhbDpiMXNtMWxsNGg=",
      "Accept": "application/json",
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch(e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    print(body.toString());
    Response response;
    try {
      response = (await http.post(
        Uri.parse('https://jrvis-frday.id/api/registers'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'fullname' : 'santan02',
          'email' : 'santan02@gmail.com',
          'password' : 'password',
          'password_confirm' : 'password_confirm',
          'phone' : '08123456770',
          'id_install' : 'null',
        }),
      )) as Response;
      print(response.toString());
      return response;
    } catch(e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}