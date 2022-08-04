
import 'package:dapurgo/models/cart_model.dart';
import 'package:dapurgo/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart';
import '../data/repository/cart_repo.dart';

class CartController extends GetxController {

  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  List<CartModel> storageItems = [];

  void addItem(Result product, int quantity) {
    var totalQuantity = 0;
    if(_items.containsKey(int.parse(product.id!))) {
      _items.update(int.parse(product.id!), (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id : product.id,
          menuName: product.menuName,
          price: product.price,
          image: product.image,
          quantity: value.quantity! + quantity,
          isExist : true,
          time: DateTime.now().toString(),
          product: product
        );
      });

      if(totalQuantity <= 0) {
        _items.remove(int.parse(product.id!));
      }
    } else {
      if(quantity > 0) {
        _items.putIfAbsent(int.parse(product.id!), () {
          return CartModel(
            id : product.id,
            menuName: product.menuName,
            price: product.price,
            image: product.image,
            quantity: quantity,
            isExist : true,
            time: DateTime.now().toString(),
            product: product
          );
        });
      } else {
        Get.snackbar("Item count", "You should at least add an item in the cart !",
            backgroundColor: AppColor.mainColor,
            colorText: Colors.white
        );
      }
    }

    cartRepo.addToCartList(getItems);

    update();
  }

  bool existInCart(Result product) {
    if(_items.containsKey(int.parse(product.id!))) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(Result product) {
    var quantity = 0;
    if(_items.containsKey(int.parse(product.id!))) {
      _items.forEach((key, value) {
        if(key == int.parse(product.id!)) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;

    _items.forEach((key, value) {
      total += value.quantity!*int.parse(value.price!);
    });

    return total;
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    //print("Length of cart items : " + storageItems.length.toString());
    for(int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(int.parse(storageItems[i].product!.id!), () => storageItems[i]);
    }
  }

  void addToHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistory();
  }

  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(getItems);
    update();
  }

}