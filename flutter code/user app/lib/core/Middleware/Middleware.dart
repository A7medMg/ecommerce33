import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/core/services/services.dart';

class MyMiddleware extends GetMiddleware{
  int? priority = 1;
  MyServices myServices=Get.find();
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString('step')=='2'){
      return RouteSettings(name: AppRoute.Home_Page);
    }
    if(myServices.sharedPreferences.getString('step')=='1'){
      return RouteSettings(name: AppRoute.Login);
    }

  }
}