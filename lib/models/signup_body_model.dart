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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirm'] = this.passwordConfirm;
    data['phone'] = this.phone;
    data['id_install'] = this.idInstall;

    return data;
  }
}