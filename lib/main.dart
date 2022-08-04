import 'package:dapurgo/controller/cart_controller.dart';
import 'package:dapurgo/controller/popular_product_controller.dart';
import 'package:dapurgo/controller/recommended_product_controller.dart';
import 'package:dapurgo/pages/auth/sign_in_page.dart';
import 'package:dapurgo/pages/auth/sign_up_page.dart';
import 'package:dapurgo/pages/cart/cart_page.dart';
import 'package:dapurgo/pages/food/popular_food_detail.dart';
import 'package:dapurgo/pages/food/recomended_food_detail.dart';
import 'package:dapurgo/pages/home/food_page_body.dart';
import 'package:dapurgo/pages/home/main_food_page.dart';
import 'package:dapurgo/pages/splash/splash_page.dart';
import 'package:dapurgo/routes/routes_helper.dart';
import 'package:dapurgo/strings/main_strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'controller/popular_product_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<CartController>().getCartData();

    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SantanGo',
         // home: SignInPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}

