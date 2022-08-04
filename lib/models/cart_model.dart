import 'package:dapurgo/models/products_model.dart';

class CartModel {
  String? id;
  String? menuName;
  String? image;
  String? price;
  int? quantity;
  bool? isExist;
  String? time;
  Result? product;

  CartModel({this.id,
        this.menuName,
        this.image,
        this.price,
        this.quantity,
        this.isExist,
        this.time,
        this.product
        });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menuName = json['menu_name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product = Result.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['menu_name'] = this.menuName;
    data['image'] = this.image;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['isExist'] = this.isExist;
    data['time'] = this.time;
    data['product'] = this.product!.toJson();

    return data;
  }
}
