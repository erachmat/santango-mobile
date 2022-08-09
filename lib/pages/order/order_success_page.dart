import 'package:dapurgo/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(width: Dimensions.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/image/check.png", width: Dimensions.width20*5,
              height: Dimensions.height20*5,),
              SizedBox(height: Dimensions.height45,),
              Text('You placed the order successfully',
                style: TextStyle(
                  fontSize: Dimensions.font20
                ),
              ),
              SizedBox(height: Dimensions.height20,),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.height20,
                    vertical: Dimensions.height10
                  ),
                child: Text('Successful order',
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Theme.of(context).disabledColor
                    ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Dimensions.height10),
            ],
          )
        ),
      ),
    );
  }
}
