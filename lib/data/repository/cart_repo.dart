import 'dart:convert';

import 'package:dapurgo/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {

  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {

    //sharedPreferences.remove(AppConstant.CART_LIST);
    //sharedPreferences.remove(AppConstant.CART_HISTORY_LIST);

    var time = DateTime.now().toString();

    cart = [];

    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstant.CART_LIST, cart);

    getCartList();
  }

  List<CartModel> getCartList() {

    List<String> carts = [];

    if(sharedPreferences.containsKey(AppConstant.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstant.CART_LIST)!;
      //print("inside getCartList" + carts.toString());
    };

    List<CartModel> cartList = [];

    carts.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }

  List<CartModel> getCartHistory() {
    if(sharedPreferences.containsKey(AppConstant.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList(AppConstant.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) => cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if(sharedPreferences.containsKey(AppConstant.CART_HISTORY_LIST)) {
      cartHistory = sharedPreferences.getStringList(AppConstant.CART_HISTORY_LIST)!;
    }
    for(int i = 0; i < cart.length; i++) {
      print("history list : " + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstant.CART_HISTORY_LIST, cartHistory);
    print("lenght history : " + getCartHistory().length.toString());
    //print("time for order : " + getCartHistory()[0].time.toString());
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstant.CART_LIST);
  }

}