import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../colors.dart';
import '../../routes/routes_helper.dart';
import '../../utils/dimensions.dart';
import '../../widget/app_icon.dart';
import '../../widget/big_text.dart';
import '../../widget/small_text.dart';

class PaymentMethodPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: Dimensions.width30, top: Dimensions.width20*3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Payment Method"),
                SizedBox(width: Dimensions.width10,),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: ".", color: Colors.black26,),
                ),
                SizedBox(width: Dimensions.width10,),
                // Container(
                //   margin: EdgeInsets.only(bottom: 2),
                //   child: SmallText(text: "Food pairing", color: Colors.grey,),
                // )
              ],
            ),
          ),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(left: Dimensions.height10,
                right: Dimensions.height10, top: Dimensions.width20),
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getOrderSuccessPage());
                },
                child: Card(child:ListTile(
                  title: Text("Mandiri"),
                  subtitle: Text("Virtual account"),
                  leading: AppIcon(icon: Icons.money,
                    backgroundColor: Colors.blue,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,),
                )),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getOrderSuccessPage());
                },
                child: Card(child:ListTile(
                  title: Text("BRI"),
                  subtitle: Text("Virtual account"),
                  leading: AppIcon(icon: Icons.money,
                    backgroundColor: Colors.blue,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,),
                )),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getOrderSuccessPage());
                },
                child: Card(child:ListTile(
                  title: Text("BCA"),
                  subtitle: Text("Virtual account"),
                  leading: AppIcon(icon: Icons.money,
                    backgroundColor: Colors.blue,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,),
                )),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getOrderSuccessPage());
                },
                child: Card(child:ListTile(
                  title: Text("BNI"),
                  subtitle: Text("Virtual account"),
                  leading: AppIcon(icon: Icons.money,
                    backgroundColor: Colors.blue,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,),
                )),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getOrderSuccessPage());
                },
                child: Card(child:ListTile(
                  title: Text("Gopay"),
                  subtitle: Text("EMoney"),
                  leading: AppIcon(icon: Icons.wallet_giftcard,
                    backgroundColor: Colors.redAccent,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,),
                )),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getOrderSuccessPage());
                },
                child: Card(child:ListTile(
                  title: Text("DANA"),
                  subtitle: Text("EMoney"),
                  leading: AppIcon(icon: Icons.wallet_giftcard,
                    backgroundColor: Colors.redAccent,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,),
                )),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getOrderSuccessPage());
                },
                child: Card(child:ListTile(
                  title: Text("OVO"),
                  subtitle: Text("EMoney"),
                  leading: AppIcon(icon: Icons.wallet_giftcard,
                    backgroundColor: Colors.redAccent,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height10*5/2,
                    size: Dimensions.height10*5,),
                )),
              ),
            ],
          ),
        ],
      )
    );
  }
}
