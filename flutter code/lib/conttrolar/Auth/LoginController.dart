import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/services/services.dart';

import '../../core/consstans/namesRout.dart';
import '../../core/functions/handlingDataController.dart';
import '../../data/datasource/remote/Auth/LoginData.dart';

abstract class LoginController extends GetxController{
  login();
  goSignUp();
  goForgetPassword();

}
class LoginControllerImp extends LoginController{
  late TextEditingController email;
  late TextEditingController password;
  bool ispasswordShow=true;
  StatusRequest  statusRequest= StatusRequest.none;
  LoginData loginData =LoginData(Get.find());
  MyServices myServices=Get.find();
  isPasswordShown(){
    ispasswordShow=ispasswordShow==true ?false:true;
    update();
  }
  GlobalKey<FormState>formstatelog=GlobalKey<FormState>();
  @override
  void onInit() {
    // TODO: implement onInit

    email=TextEditingController();
    password=TextEditingController();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  login() async{
    if(formstatelog.currentState!.validate()){
      statusRequest= StatusRequest.loading;
      update();
      var response= await loginData.postData(email.text,password.text);
      statusRequest=handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status']=='success'){
         if(response['data']['users_approve']==1){
           myServices.sharedPreferences.setString("id", response['data']['users_id'].toString());
           myServices.sharedPreferences.setString("username", response['data']['users_name']);
           myServices.sharedPreferences.setString("email", response['data']['users_email']);
           myServices.sharedPreferences.setString("phone", response['data']['users_phone']);
           myServices.sharedPreferences.setString("step", '2');
           Get.offNamed(AppRoute.Home_Page);
         }else{
           Get.toNamed(AppRoute.verifyEmailCode,arguments: {
             "email":email.text
           });
         }
        }else{
          Get.defaultDialog(title: "Warning",middleText: ' email or password not exists');
          statusRequest=StatusRequest.failure;
        }

      }
      update();
      //Get.offNamed(AppRoute.verifyEmailCode);
      // Get.delete<SignUpControllerImp>();
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



}