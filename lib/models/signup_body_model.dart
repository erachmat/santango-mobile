import 'dart:convert';

class SignUpBody {

  String fullname;
  String email;
  String password;
  String passwordConfirm;
  String phone;
  String idInstall;

  SignUpBody({
    required this.fullname,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.phone,
    required this.idInstall,
  });

  factory SignUpBody.fromJson(Map<String, dynamic> map) {
    // return SignUpBody(em: map["em"], ps: map["ps"]);
    return SignUpBody(fullname: map["fullname"], email: map["email"],
        password: map["password"], passwordConfirm: map["password_confirm"],
        phone: map["phone"], idInstall: map["id_install"]);
  }

  Map<String, dynamic> toJson() {
    return {"fullname": fullname, "email": email, "password": password, "password_confirm": passwordConfirm, "phone": phone, "id_install": idInstall};
    // return {"em": em, "ps": ps};
  }

  @override
  String toString() {
    // return '{em: $em, ps: $ps}';
    return '{fullname: $fullname, email: $email, password: $password, password_confirm: $passwordConfirm, phone: $phone, id_install: $idInstall}';
  }

}

List<SignUpBody> signupFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<SignUpBody>.from(data.map((item) => SignUpBody.fromJson(item)));
}

String signupToJson(SignUpBody data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}