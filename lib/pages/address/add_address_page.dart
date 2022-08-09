import 'package:dapurgo/controller/location_controller.dart';
import 'package:dapurgo/routes/routes_helper.dart';
import 'package:dapurgo/utils/dimensions.dart';
import 'package:dapurgo/widget/app_text_field.dart';
import 'package:dapurgo/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../colors.dart';
import '../../widget/app_icon.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {

  TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();
  late bool _isLogged;
  CameraPosition _cameraPosition = const CameraPosition(target: LatLng(
      -7.7601187279032935, 110.40904548573295
  ), zoom: 17);
  late LatLng _initialPosition = LatLng(
      -7.7601187279032935, 110.40904548573295
  );

  @override
  void initState() {
    super.initState();
    if(Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(target: LatLng(
        double.parse(Get.find<LocationController>().getAddress["latitude"]),
          double.parse(Get.find<LocationController>().getAddress["longitude"])
      ));
      _initialPosition = LatLng(double.parse(Get.find<LocationController>().getAddress["latitude"]),
          double.parse(Get.find<LocationController>().getAddress["longitude"])
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Page"),
        backgroundColor: AppColor.mainColor,
      ),
      body: GetBuilder<LocationController>(builder: (locationController) {
        _addressController.text = '${locationController.placemark.name?? ''}';
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                    top: 5
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                        width: 2, color: AppColor.mainColor
                    )
                ),
                child: Stack(
                  children: [
                    GoogleMap(initialCameraPosition:
                    CameraPosition(target: _initialPosition, zoom: 17),
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                      indoorViewEnabled: true,
                      mapToolbarEnabled: false,
                      onCameraIdle: (){
                        locationController.updatePosition(_cameraPosition, true);
                      },
                      onCameraMove: ((position) => _cameraPosition = position),
                      onMapCreated: (GoogleMapController controller) {

                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height20),
                child: SizedBox(height: 50, child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: locationController.addressTypeList.length,
                    itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      locationController.setAddressTypeIndex(index);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,
                      vertical: Dimensions.height10),
                      margin: EdgeInsets.only(right: Dimensions.width10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200]!,
                            spreadRadius: 1,
                            blurRadius: 5
                          )
                        ]
                      ),
                      child: Icon(
                          index == 0? Icons.home_filled: index==1?
                          Icons.work: Icons.location_on,
                          color: locationController.addressTypeIndex == index?
                          AppColor.mainColor: Theme.of(context).disabledColor)
                    ),
                  );
                }),),
              ),
              SizedBox(height: Dimensions.height20),
              Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.width20
                  ),
                  child: BigText(text: "Delivery Address")),
              SizedBox(height: Dimensions.height20),
              AppTextField(textController: _addressController,
                  hintText: "Your address", icon: Icons.map, obsecure: false),
              SizedBox(height: Dimensions.height20),
              AppTextField(textController: _contactPersonName,
                  hintText: "Your name", icon: Icons.person, obsecure: false),
              SizedBox(height: Dimensions.height20),
              AppTextField(textController: _contactPersonNumber,
                  hintText: "Your number", icon: Icons.phone, obsecure: false),
            ],
          ),
        );
      }),
      bottomNavigationBar: GetBuilder<LocationController>(builder: (locationController) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.paymentMethodPage);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: Dimensions.width20),
                      padding: EdgeInsets.only(top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20
                      ),
                      child: BigText(text: "Save address", color: Colors.white, size: Dimensions.font26,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: AppColor.mainColor
                      ),
                    ),
                  )
                ],
              ),
          ],
        );
      }),
    );
  }
}

