import 'package:dapurgo/base/no_data_page.dart';
import 'package:dapurgo/colors.dart';
import 'package:dapurgo/controller/cart_controller.dart';
import 'package:dapurgo/controller/popular_product_controller.dart';
import 'package:dapurgo/pages/home/main_food_page.dart';
import 'package:dapurgo/routes/routes_helper.dart';
import 'package:dapurgo/utils/app_constants.dart';
import 'package:dapurgo/utils/dimensions.dart';
import 'package:dapurgo/widget/app_icon.dart';
import 'package:dapurgo/widget/big_text.dart';
import 'package:dapurgo/widget/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/recommended_product_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20*3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColor.mainColor,
                  iconSize: Dimensions.iconSize24,),
                  SizedBox(width: Dimensions.width20*5,),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColor.mainColor,
                      iconSize: Dimensions.iconSize24,),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColor.mainColor,
                    iconSize: Dimensions.iconSize24,),
                ],
          )),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0? Positioned(
                top: Dimensions.height20*5,
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height15),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GetBuilder<CartController>(builder: (cartController) {
                      var _cartList = cartController.getItems;
                      return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_, index) {
                            return Container(
                              width: double.maxFinite,
                              height: Dimensions.height20*5,
                              margin: EdgeInsets.only(bottom: Dimensions.height10),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      var popularIndex = Get.find<PopularProductController>()
                                          .popularProductList
                                          .indexOf(_cartList[index].product!);
                                      if(popularIndex >= 0) {
                                        Get.toNamed(
                                          '/popular-food/$popularIndex?page=cartPage',
                                        );
                                      } else {
                                        var recommendedIndex = Get.find<RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(_cartList[index].product!);
                                        if(recommendedIndex < 0) {
                                          Get.snackbar("History Product", "Product review is not available on history product !",
                                              backgroundColor: AppColor.mainColor,
                                              colorText: Colors.white
                                          );
                                        } else {
                                          Get.toNamed(
                                            '/recommended-food/$recommendedIndex?page=cartPage',
                                          );
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: Dimensions.height20*5,
                                      height: Dimensions.height20*5,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstant.PROD_URL + _cartList[index].image!.substring(28)
                                            )
                                        ),
                                        borderRadius: BorderRadius.circular(Dimensions.radius20),

                                      ),
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width10),
                                  Expanded(child: Container (
                                    height: Dimensions.height20*5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(text: _cartList[index].menuName!, color: Colors.black54,),
                                        SmallText(text: "Spicy", color: Colors.grey,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(text: _cartList[index].price!.toString(), color: Colors.redAccent,),
                                            Container(
                                              padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                  color: Colors.white
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                      onTap: (){
                                                        cartController.addItem(_cartList[index].product!, -1);
                                                      },
                                                      child: Icon(Icons.remove, color: Colors.grey,)
                                                  ),
                                                  SizedBox(width: Dimensions.width10/2,),
                                                  BigText(text:_cartList[index].quantity.toString()),
                                                  SizedBox(width: Dimensions.width10/2,),
                                                  GestureDetector(
                                                      onTap: (){
                                                        cartController.addItem(_cartList[index].product!, 1);
                                                      },
                                                      child: Icon(Icons.add, color: Colors.grey,)
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            );
                          });
                    }),
                  ),
                ))
                : NoDataPage(text: "Your cart is empty !");
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController> (builder: (cartProducts) {
        return Container(
          height: 120,
          padding: EdgeInsets.only(top: Dimensions.height30,
              bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20
          ),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2)
              )
          ),
          child: cartProducts.getItems.length > 0? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text: "\Rp " + cartProducts.totalAmount.toString()),
                    SizedBox(width: Dimensions.width10/2,),

                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  cartProducts.addToHistory();
                  Get.toNamed(RouteHelper.addAddress);
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,
                      bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20
                  ),
                  child: BigText(text: "Check out",
                    color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColor.mainColor
                  ),
                ),
              )
            ],
          )
              : Container(),
        );
      }),
    );
  }
}
