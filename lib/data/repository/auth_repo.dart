import 'package:dapurgo/data/api/api_client.dart';
import 'package:dapurgo/models/signup_body_model.dart';
import 'package:dapurgo/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences
  });

  Future<http.Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(AppConstant.REGISTRATION_URI, signupToJson(signUpBody));
  }

  saveUserToken(String? token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstant.TOKEN, token != null? token:"");
  }
}