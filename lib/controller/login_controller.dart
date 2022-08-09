import 'dart:convert';

import 'package:dapurgo/models/login_model.dart';
import 'package:dapurgo/models/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../data/repository/login_repo.dart';
import '../models/signin_model.dart';

class LoginController extends GetxController implements GetxService {

  final LoginRepo loginRepo;

  LoginController({required this.loginRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<dynamic> _loginResult = [];
  List<dynamic> get loginResult => _loginResult;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  // Future<LoginResponseModel(result: result, code: code, message: message)> login(LoginModel loginModel) async {

    // Response response = await loginRepo.login();
    // var responseBody = LoginResponseModel(result: result, code: code, message: message).fromJson(response.body);
    //
    // if(responseBody.code == 200) {
    //
    //   // print("get products");
    //   _loginResult = [];
    //   _loginResult.addAll(LoginResponseModel(result: result, code: code, message: message).fromJson(response.body).result);
    //
    //   _isLoaded = true;
    //
    //   update();
    // } else {
    //
    // }

  Future<LoginResponseModel> login(LoginModel loginModel) async {

    _isLoading = true;

    http.Response response = await loginRepo.login(loginModel);

    late LoginResponseModel responseModel;

    // print("ini response : " + response.body.toString());

    responseModel = LoginResponseModel.fromJson(jsonDecode(response.body));

    if(int.parse(responseModel.code) == 200) {
      loginRepo.saveUserToken(responseModel.result?[0].accessToken);
      // responseModel = ResponseModel(true, response.body["token"]);
      responseModel = LoginResponseModel(result: responseModel.result, message: responseModel.message, code: responseModel.code);
    } else {
      responseModel = LoginResponseModel(result: null, message: responseModel.message, code: responseModel.code);
    }

    _isLoading = true;

    update();
    return responseModel;
  }
}