
import 'package:dapurgo/controller/login_controller.dart';
import 'package:dapurgo/models/login_model.dart';
import 'package:dapurgo/pages/account/account_page.dart';
import 'package:dapurgo/pages/auth/sign_up_page.dart';
import 'package:dapurgo/utils/app_constants.dart';
import 'package:dapurgo/utils/dimensions.dart';
import 'package:dapurgo/widget/app_text_field.dart';
import 'package:dapurgo/widget/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/show_custom_snackbar.dart';
import '../../colors.dart';
import '../../data/api/api_client.dart';
import '../../routes/routes_helper.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final ApiClient apiClient = ApiClient(appBaseUrl: AppConstant.BASE_URL);

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login() {

      var loginController = Get.find<LoginController>();

      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(email.isEmpty) {
        showCustomSnackBar("Type in your email", title: "Email");
      } else if(password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else {
        LoginModel loginModel = LoginModel(em: email, ps: password);
        loginController.login(loginModel).then((status) {
          if(int.parse(status.code) == 200) {
            showCustomSnackBar("Login Success", title: "Perfect");
            Get.toNamed(RouteHelper.getAccountPage());
            emailController.clear();
            passwordController.clear();
          } else {
            showCustomSnackBar("Login Failed");
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
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: Dimensions.font20*3 + Dimensions.font20/2,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        color: Colors.grey[500]
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: emailController,
                hintText: "Email",
                icon: Icons.email, obsecure: false),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp, obsecure: true,),
            SizedBox(height: Dimensions.height20,),
            // Row(
            //   children: [
            //     Expanded(child: Container()),
            //     RichText(
            //         text: TextSpan(
            //             text: "Sign into your account",
            //             style: TextStyle(
            //                 color: Colors.grey[500],
            //                 fontSize: Dimensions.font20
            //             )
            //         )
            //     ),
            //     SizedBox(height: Dimensions.width20,),
            //   ],
            // ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColor.mainColor
              ),
              child: GestureDetector(
                onTap: (){
                  _login();
                },
                child: Center(
                    child: BigText(text: "Sign in",
                      size: Dimensions.font20 + Dimensions.font20/2,
                      color: Colors.white,),
                  ),
              ),
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            RichText(
                text: TextSpan(
                    text: "Don\'t have an account ?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font16
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => SignUpPage(), transition: Transition.fade),
                        text: " Create",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.mainBlackColor,
                            fontSize: Dimensions.font16
                        )
                      )
                    ]
                )
            )
          ],
        ),
      ),
    );
  }
}
