import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopadmin/core/classes/statusrequest.dart';
import 'package:shopadmin/core/services/services.dart';
import 'package:shopadmin/data/datasource/remote/setting.dart';

import '../../core/consstans/namesRout.dart';
import '../../core/functions/handlingDataController.dart';
import '../../data/datasource/remote/Auth/LoginData.dart';

abstract class SettingController extends GetxController{
  setSetting();


}
class SettingControllerImp extends SettingController{
  late TextEditingController body;
  late TextEditingController title;
  bool ispasswordShow=true;
  StatusRequest  statusRequest= StatusRequest.none;
  SettingData settingData =SettingData(Get.find());
  MyServices myServices=Get.find();

  GlobalKey<FormState>formstatelog=GlobalKey<FormState>();
  @override
  void onInit() {
    // TODO: implement onInit
    FirebaseMessaging.instance.getToken().then((value) {
      print("////////////////////token/////////////////");
      print(value);

      String ? token=value;
    } );
    body=TextEditingController();
    title=TextEditingController();
  }
  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }
  @override
  setSetting() async{
    if(formstatelog.currentState!.validate()){
      statusRequest= StatusRequest.loading;

      update();
      var response= await settingData.postData(title.text,body.text);
      print(response);
      statusRequest=handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status']=='success'){


            Get.offNamed(AppRoute.Home_Page);
          }

    else{

    }
  }

  @override
  goSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }



}}

}