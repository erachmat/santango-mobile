import 'package:dapurgo/colors.dart';
import 'package:dapurgo/utils/dimensions.dart';
import 'package:dapurgo/widget/account_widget.dart';
import 'package:dapurgo/widget/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes_helper.dart';
import '../../widget/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: BigText(
          text: "Profile", size: 24, color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            AppIcon(icon: Icons.person,
              backgroundColor: AppColor.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45 + Dimensions.height30,
              size: Dimensions.height15*10,),
            SizedBox(height: Dimensions.height30,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.person,
                          backgroundColor: AppColor.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,)
                        , bigText: BigText(text: "Santan",)),
                    SizedBox(height: Dimensions.height20,),
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.phone,
                          backgroundColor: Colors.yellow,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,)
                        , bigText: BigText(text: "08123456778",)),
                    SizedBox(height: Dimensions.height20,),
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.email,
                          backgroundColor: Colors.yellow,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,)
                        , bigText: BigText(text: "admin@santango.com",)),
                    SizedBox(height: Dimensions.height20,),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getAddressPage());
                      },
                      child: AccountWidget(
                          appIcon: AppIcon(icon: Icons.location_on,
                            backgroundColor: AppColor.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,)
                          , bigText: BigText(text: "Jakarta",)),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.message_outlined,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,)
                        , bigText: BigText(text: "Message",))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
