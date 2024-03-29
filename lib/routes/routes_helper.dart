import 'package:dapurgo/pages/account/account_page.dart';
import 'package:dapurgo/pages/address/add_address_page.dart';
import 'package:dapurgo/pages/cart/cart_page.dart';
import 'package:dapurgo/pages/food/popular_food_detail.dart';
import 'package:dapurgo/pages/food/recomended_food_detail.dart';
import 'package:dapurgo/pages/home/home_page.dart';
import 'package:dapurgo/pages/home/main_food_page.dart';
import 'package:dapurgo/pages/order/order_success_page.dart';
import 'package:dapurgo/pages/payment/payment_method_page.dart';
import 'package:dapurgo/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {

  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String addAddress = "/add-address";
  static const String accountPage = "/account-page";
  static const String paymentMethodPage = "/payment-method-page";
  static const String orderSuccessPage = "/order-success-page";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getAccountPage() => '$accountPage';
  static String getPopularFood(int pageId) => '$popularFood/:pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood/:pageId=$pageId';
  static String getCartPage() => '$cartPage';
  static String getAddressPage() => '$addAddress';
  static String getPaymentMethodPage() => '$paymentMethodPage';
  static String getOrderSuccessPage() => '$orderSuccessPage';

  static List<GetPage> routes = [

    GetPage(name: splashPage, page: () => SplashScreen()),

    GetPage(name: initial, page: () => HomePage()),

    GetPage(name: accountPage, page: () => AccountPage()),

    GetPage(name: '/popular-food/:data', page: () {
      var pageId =  Get.parameters['data'];
      var page = Get.parameters['page'];
      return PopularFoodDetail(pageId:int.parse(pageId!), page: page!,);
    },
      transition: Transition.fadeIn
    ),

    GetPage(name: '/recommended-food/:data', page: () {
      var pageId =  Get.parameters['data'];
      var page = Get.parameters['page'];
      return RecommendedFoodDetail(pageId:int.parse(pageId!), page: page!);
    },
        transition: Transition.fadeIn
    ),

    GetPage(name: cartPage, page: () {
      return CartPage();
    },
    transition: Transition.fadeIn),

    GetPage(name: addAddress, page: () {
      return AddAddressPage();
    }),

    GetPage(name: paymentMethodPage, page: () {
      return PaymentMethodPage();
    }),

    GetPage(name: orderSuccessPage, page: () {
      return OrderSuccessPage();
    })
  ];
}