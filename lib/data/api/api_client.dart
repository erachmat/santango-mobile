import 'dart:convert';

import 'package:dapurgo/models/signup_body_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/login_model.dart';
import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {

  late String? token;
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

  void updateHeader(String? token) {
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

  Future<http.Response> postData(String uri, String json) async {

    print(json.toString());

    final response = (await http.post(
      Uri.parse('https://jrvis-frday.id/api/registers'),
      headers: {'Content-type' : 'application/json',
        "x-api-key": "aG9tZXJlbnRhbDpiMXNtMWxsNGg=",
        "Accept": "application/json"},
      // body: signupToJson(data),
      body: json,
    ));

    print(response.body.toString());

    return response;

    // try {
    //   Response response = (await http.post(
    //     Uri.parse('https://jrvis-frday.id/api/registers'),
    //     headers: {'Content-type' : 'application/json',
    //       "x-api-key": "aG9tZXJlbnRhbDpiMXNtMWxsNGg=",
    //       "Accept": "application/json"},
    //     // body: signupToJson(data),
    //     body: json,
    //   )) as Response;
    //
    //   return response;
    // } catch(e) {
    //   return Response(statusCode: 1, statusText: e.toString());
    // }

    // Response response = (await http.post(
    //   Uri.parse('https://jrvis-frday.id/api/registers'),
    //   headers: {'Content-type' : 'application/json',
    //     "x-api-key": "aG9tZXJlbnRhbDpiMXNtMWxsNGg=",
    //     "Accept": "application/json"},
    //   body: signupToJson(data),
    // )) as Response;
    //
    // print(response.body.toString());
    //
    // if (response.statusCode == 200) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<http.Response> login(String uri, String json) async {

    print(json.toString());

    final response = (await http.post(
      Uri.parse('https://jrvis-frday.id/api/login'),
      headers: {'Content-type' : 'application/json',
        "x-api-key": "aG9tZXJlbnRhbDpiMXNtMWxsNGg=",
        "Accept": "application/json"},
      // body: signupToJson(data),
      body: json,
    ));

    print(response.body.toString());

    return response;

    // print(data.toString());
    //
    // final response = await http.post(
    //   Uri.parse('https://jrvis-frday.id/api/login'),
    //   headers: {'Content-type' : 'application/json',
    //     "x-api-key": "aG9tZXJlbnRhbDpiMXNtMWxsNGg=",
    //     "Accept": "application/json"},
    //   body: profileToJson(data),
    // );
    //
    // print(response.body.toString());
    //
    // if (response.statusCode == 200) {
    //   return true;
    // } else {
    //   return false;
    // }
  }
}