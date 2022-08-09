import 'dart:convert';

class LoginModel {
  String em;
  String ps;

  LoginModel({required this.em, required this.ps});

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(em: map["em"], ps: map["ps"]);
  }

  Map<String, dynamic> toJson() {
    return {"em": em, "ps": ps};
  }

  @override
  String toString() {
    return '{em: $em, ps: $ps}';
  }

}

List<LoginModel> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<LoginModel>.from(data.map((item) => LoginModel.fromJson(item)));
}

String profileToJson(LoginModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}