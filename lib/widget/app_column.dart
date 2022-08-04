import 'package:dapurgo/utils/dimensions.dart';
import 'package:dapurgo/widget/big_text.dart';
import 'package:dapurgo/widget/small_text.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {

  final String text;

  AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
                children: List.generate(5, (index) {return Icon(Icons.star, color: AppColor.mainColor, size: 15,);})
            ),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "4.5"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "1287"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(height: Dimensions.height20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColor.mainColor,
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: "1.7 Km",
              iconColor: AppColor.mainColor,
            ),
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "32 min",
              iconColor: AppColor.mainColor,
            ),
          ],
        )
      ],
    );
  }
}
