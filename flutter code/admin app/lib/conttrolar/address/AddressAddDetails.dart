import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopadmin/core/classes/statusrequest.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';
import 'package:shopadmin/core/services/services.dart';

import '../../core/functions/handlingDataController.dart';
import '../../data/datasource/remote/addressdata.dart';

class AddressAddDetailsController extends GetxController {
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat;
  String? long;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  List data = [];
   StatusRequest statusRequest=StatusRequest.none;

  void onInit() {
    // TODO: implement onInit
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    intialData();
    super.onInit();
  }

  intialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(
        "//////////////////////////////////////////////////////////////////////////////////////////////////////////////////");
    print(lat);
    print(long);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getString('id')!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.Home_Page);
        Get.snackbar("success", "Now, you can order to this address ");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
