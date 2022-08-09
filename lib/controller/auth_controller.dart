
import 'dart:convert';

import 'package:dapurgo/models/response_model.dart';
import 'package:dapurgo/models/signin_model.dart';
import 'package:dapurgo/models/signup_body_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {

  final AuthRepo authRepo;

  AuthController({
    required this.authRepo
  });

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<SigninModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;

    http.Response response = await authRepo.registration(signUpBody);

    late SigninModel responseModel;

    // print("ini response : " + response.body.toString());

    responseModel = SigninModel.fromJson(jsonDecode(response.body));

    if(int.parse(responseModel.code)  == 200) {
      authRepo.saveUserToken(responseModel.result?.accessToken);
      // responseModel = ResponseModel(true, response.body["token"]);
      responseModel = SigninModel(result: responseModel.result, message: responseModel.message, code: responseModel.code);
    } else {
      responseModel = SigninModel(result: null, message: responseModel.message, code: responseModel.code);
    }

    _isLoading = true;

    update();
    return responseModel;
  }
}