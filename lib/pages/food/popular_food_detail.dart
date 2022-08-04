import 'package:dapurgo/controller/cart_controller.dart';
import 'package:dapurgo/controller/popular_product_controller.dart';
import 'package:dapurgo/pages/home/main_food_page.dart';
import 'package:dapurgo/routes/routes_helper.dart';
import 'package:dapurgo/utils/dimensions.dart';
import 'package:dapurgo/widget/app_column.dart';
import 'package:dapurgo/widget/app_icon.dart';
import 'package:dapurgo/widget/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors.dart';
import '../../utils/app_constants.dart';
import '../../widget/big_text.dart';
import '../../widget/icon_and_text_widget.dart';
import '../../widget/small_text.dart';
import '../cart/cart_page.dart';

class PopularFoodDetail extends StatelessWidget {

  final int pageId;
  final String page;
  PopularFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    // print("pageId : " + pageId.toString());
    // print("product Name : " + product.menuName.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover ,
                        image: NetworkImage(
                            AppConstant.PROD_URL + product.image!.substring(28)
                          // "assets/image/food02.jpg"
                        )
                    )
                ),
              )),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap : (){
                        if(page == "cartPage") {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: (){
                        if(controller.totalItems >= 1) {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1?
                          Positioned(
                            right: 0, top: 0,
                            child: AppIcon(icon: Icons.circle,
                              size: 20,
                              iconColor: Colors.transparent,
                              backgroundColor: AppColor.mainColor,),
                          ) : Container(),
                          controller.totalItems >= 1?
                          Positioned(
                            right: 3,
                            top: 3,
                            child: BigText(text:  Get.find<PopularProductController>().totalItems.toString(),
                            size: 12, color: Colors.white,
                            ),
                          ) : Container(),
                        ],
                      ),
                    );
                  })
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),),
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.menuName!),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Description"),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(text: product.description!)
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProducts) {
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
          child: Row(
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
                    GestureDetector(
                        onTap: (){
                          popularProducts.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: Colors.grey,)
                    ),
                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text: popularProducts.inCartItems.toString()),
                    SizedBox(width: Dimensions.width10/2,),
                    GestureDetector(
                        onTap: (){
                          popularProducts.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: Colors.grey,)
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProducts.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,
                      bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20
                  ),
                    child: BigText(text: "\Rp ${product.price!} | Add to cart",
                      color: Colors.white,),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColor.mainColor
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );

  }
}
