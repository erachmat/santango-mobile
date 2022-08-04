class Product {
  late List<Result> _result;
  List<Result> get result => _result;
  String? _message;
  String? _code;

  Product({required result, required message, required code}) {
    this._result = result;
    this._message = message;
    this._code = code;
  }

  Product.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      _result = <Result>[];
      json['result'].forEach((v) {
        _result.add(new Result.fromJson(v));
      });
    }
    _message = json['message'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._result != null) {
      data['result'] = this._result.map((v) => v.toJson()).toList();
    }
    data['message'] = this._message;
    data['code'] = this._code;
    return data;
  }
}

class Result {
  String? id;
  String? idRent;
  String? idDiningCategory;
  String? menuName;
  String? image;
  String? description;
  String? price;
  String? stock;
  String? rating;
  String? promo;
  String? isRecommend;
  String? dineIn;
  String? roomService;
  String? takeAway;
  String? isActive;
  String? isAvailable;
  Null? updatedId;
  Null? dateDeleted;
  int? distance;
  Null? discountType;
  Null? discountValue;
  String? title;
  String? address;

  Result(
      {this.id,
        this.idRent,
        this.idDiningCategory,
        this.menuName,
        this.image,
        this.description,
        this.price,
        this.stock,
        this.rating,
        this.promo,
        this.isRecommend,
        this.dineIn,
        this.roomService,
        this.takeAway,
        this.isActive,
        this.isAvailable,
        this.updatedId,
        this.dateDeleted,
        this.distance,
        this.discountType,
        this.discountValue,
        this.title,
        this.address});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRent = json['id_rent'];
    idDiningCategory = json['id_dining_category'];
    menuName = json['menu_name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    rating = json['rating'];
    promo = json['promo'];
    isRecommend = json['is_recommend'];
    dineIn = json['dine_in'];
    roomService = json['room_service'];
    takeAway = json['take_away'];
    isActive = json['is_active'];
    isAvailable = json['is_available'];
    updatedId = json['updated_id'];
    dateDeleted = json['date_deleted'];
    distance = json['distance'];
    discountType = json['discount_type'];
    discountValue = json['discount_value'];
    title = json['title'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    // return {
    //   "id": this.id,
    //   "menuName": this.menuName,
    //   "image": this.image,
    //   "price": this.price,
    //   "distance": this.distance,
    //   "title": this.title,
    //   "address": this.address,
    // };

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_rent'] = this.idRent;
    data['id_dining_category'] = this.idDiningCategory;
    data['menu_name'] = this.menuName;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['rating'] = this.rating;
    data['promo'] = this.promo;
    data['is_recommend'] = this.isRecommend;
    data['dine_in'] = this.dineIn;
    data['room_service'] = this.roomService;
    data['take_away'] = this.takeAway;
    data['is_active'] = this.isActive;
    data['is_available'] = this.isAvailable;
    data['updated_id'] = this.updatedId;
    data['date_deleted'] = this.dateDeleted;
    data['distance'] = this.distance;
    data['discount_type'] = this.discountType;
    data['discount_value'] = this.discountValue;
    data['title'] = this.title;
    data['address'] = this.address;
    return data;
  }
}
