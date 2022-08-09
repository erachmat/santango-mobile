import 'package:dapurgo/models/login_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class LoginRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LoginRepo({required this.apiClient, required this.sharedPreferences});

  Future<http.Response> login(LoginModel loginModel) async {
    return await apiClient.login(AppConstant.LOGIN_URI, profileToJson(loginModel));
  }

  saveUserToken(String? token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstant.TOKEN, token != null? token:"");
  }
}