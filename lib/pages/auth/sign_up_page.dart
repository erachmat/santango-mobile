
import 'package:dapurgo/base/show_custom_snackbar.dart';
import 'package:dapurgo/controller/auth_controller.dart';
import 'package:dapurgo/utils/dimensions.dart';
import 'package:dapurgo/widget/app_text_field.dart';
import 'package:dapurgo/widget/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors.dart';
import '../../models/signup_body_model.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    void _registration() {

      var authController = Get.find<AuthController>();

      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String idInstall = "null";

      if(name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if(phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone Number");
      } else if(email.isEmpty) {
        showCustomSnackBar("Type in your email address", title: "Email Address");
      } else if(!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address", title: "Valid Email Address");
      } else if(password.isEmpty) {
        showCustomSnackBar("Type in a valid password", title: "Password");
      } else if(password.length < 6) {
        showCustomSnackBar("Password cannot be less than six characters", title: "Password");
      } else {
        showCustomSnackBar("All went well", title: "Perfect");
        SignUpBody signUpBody = SignUpBody(fullname: name, email: email,
            password: password, passwordConfirm: password,
            phone: phone, idInstall: idInstall);
        authController.registration(signUpBody).then((status) {
          if(status.isSuccess) {
            print("Success registration ");
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight*0.05,),
            Container(
              height: Dimensions.screenHeight*0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: Dimensions.radius20*4,
                  backgroundImage: AssetImage(
                    "assets/image/Fav SantanGo.png"
                  ),
                ),
              ),
            ),
            AppTextField(textController: emailController,
                hintText: "Email",
                icon: Icons.email),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: nameController,
                hintText: "Name",
                icon: Icons.person),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: phoneController,
                hintText: "Phone",
                icon: Icons.phone),
            SizedBox(height: Dimensions.height20,),

            GestureDetector(
              onTap: (){
                _registration();
              },
              child: Container(
                width: Dimensions.screenWidth/2,
                height: Dimensions.screenHeight/13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColor.mainColor
                ),
                child: Center(
                  child: BigText(text: "Sign up",
                  size: Dimensions.font20 + Dimensions.font20/2,
                  color: Colors.white,),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                    text: "Have an account already ?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font16
                  )
                )
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            CircleAvatar(
              radius: Dimensions.radius30,
              backgroundImage: AssetImage(
                "assets/image/g.png"
              ),
            )
          ],
        ),
      ),
    );

  }
}
