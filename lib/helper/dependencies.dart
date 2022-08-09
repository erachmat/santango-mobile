import 'package:dapurgo/controller/auth_controller.dart';
import 'package:dapurgo/controller/cart_controller.dart';
import 'package:dapurgo/controller/location_controller.dart';
import 'package:dapurgo/controller/popular_product_controller.dart';
import 'package:dapurgo/controller/recommended_product_controller.dart';
import 'package:dapurgo/data/api/api_client.dart';
import 'package:dapurgo/data/repository/cart_repo.dart';
import 'package:dapurgo/data/repository/popular_product_repo.dart';
import 'package:dapurgo/data/repository/recommended_product_repo.dart';
import 'package:dapurgo/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/login_controller.dart';
import '../data/repository/auth_repo.dart';
import '../data/repository/location_repo.dart';
import '../data/repository/login_repo.dart';

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstant.BASE_URL));

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => LoginRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => LoginController(loginRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));

}