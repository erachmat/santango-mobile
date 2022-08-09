class LoginResponseModel {
  // late List<Result>? _result;
  // late String _code;
  // late String _message;
  //
  // String get code => _code;
  // String get message => _message;
  // List<Result>? get result => _result;
  //
  // LoginResponseModel({required result, required code, required message}) {
  //   this._result = result;
  //   this._message = message;
  //   this._code = code;
  // }

  late List<Result>? _result;
  late String _code;
  late String _message;

  String get code => _code;
  String get message => _message;
  List<Result>? get result => _result;

  LoginResponseModel({required result, required message, required code}) {
    this._result = result;
    this._message = message;
    this._code = code;
  }

  LoginResponseModel.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    if(int.parse(_code) == 200) {
      _result = <Result>[];
          json['result'].forEach((v) {
            _result?.add(new Result.fromJson(v));
          });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.result != null) {
  //     data['result'] = this.result!.map((v) => v.toJson()).toList();
  //   }
  //   data['code'] = this.code;
  //   data['message'] = this.message;
  //   return data;
  // }
}

class Result {
  String? idUser;
  String? fullname;
  String? username;
  String? passwordUser;
  String? phone;
  String? email;
  String? about;
  String? image;
  String? gender;
  String? location;
  String? country;
  String? latitude;
  String? level;
  String? idInstall;
  String? uidFcm;
  String? totalRent;
  String? totalLike;
  String? totalComment;
  String? totalFollower;
  String? totalFollowing;
  String? timestamp;
  String? flag;
  String? status;
  String? dateCreated;
  String? dateUpdated;
  String? accessToken;

  Result(
      {this.idUser,
        this.fullname,
        this.username,
        this.passwordUser,
        this.phone,
        this.email,
        this.about,
        this.image,
        this.gender,
        this.location,
        this.country,
        this.latitude,
        this.level,
        this.idInstall,
        this.uidFcm,
        this.totalRent,
        this.totalLike,
        this.totalComment,
        this.totalFollower,
        this.totalFollowing,
        this.timestamp,
        this.flag,
        this.status,
        this.dateCreated,
        this.dateUpdated,
        this.accessToken});

  Result.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    fullname = json['fullname'];
    username = json['username'];
    passwordUser = json['password_user'];
    phone = json['phone'];
    email = json['email'];
    about = json['about'];
    image = json['image'];
    gender = json['gender'];
    location = json['location'];
    country = json['country'];
    latitude = json['latitude'];
    level = json['level'];
    idInstall = json['id_install'];
    uidFcm = json['uid_fcm'];
    totalRent = json['total_rent'];
    totalLike = json['total_like'];
    totalComment = json['total_comment'];
    totalFollower = json['total_follower'];
    totalFollowing = json['total_following'];
    timestamp = json['timestamp'];
    flag = json['flag'];
    status = json['status'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['password_user'] = this.passwordUser;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['about'] = this.about;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['location'] = this.location;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['level'] = this.level;
    data['id_install'] = this.idInstall;
    data['uid_fcm'] = this.uidFcm;
    data['total_rent'] = this.totalRent;
    data['total_like'] = this.totalLike;
    data['total_comment'] = this.totalComment;
    data['total_follower'] = this.totalFollower;
    data['total_following'] = this.totalFollowing;
    data['timestamp'] = this.timestamp;
    data['flag'] = this.flag;
    data['status'] = this.status;
    data['date_created'] = this.dateCreated;
    data['date_updated'] = this.dateUpdated;
    data['access_token'] = this.accessToken;
    return data;
  }
}
