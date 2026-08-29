import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/data/datasource/remote/Auth/signup.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/functions/handlingDataController.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goLogin();
  goCheckEmail();
}
class SignUpControllerImp extends SignUpController{
 late TextEditingController username;
 late TextEditingController email;
 late TextEditingController phone;
 late TextEditingController password;
   StatusRequest  statusRequest=StatusRequest.none;
 SignupData signupData=SignupData(Get.find());
 List data=[];
 GlobalKey<FormState>formstateSign=GlobalKey<FormState>();
 @override
  void onInit() {
   username=TextEditingController();
   email=TextEditingController();
   phone=TextEditingController();
   password=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();



  }
  @override
  goLogin() {
   Get.offNamed(AppRoute.Login);
  }

  @override
  signUp() {

  }

  @override
  goCheckEmail()async {

   if(formstateSign.currentState!.validate()){
      statusRequest= StatusRequest.loading;
      update();
     var response= await signupData.postData(username.text,email.text,password.text,phone.text);
     statusRequest=handlingData(response);
     if(statusRequest == StatusRequest.success){
       if(response['status']=='success'){
         //data.addAll(response['data']);
         Get.offNamed(AppRoute.verifyEmailCode,arguments: {
           "email":email.text
         });
       }else{
         Get.defaultDialog(title: "Warning",middleText: 'phone or email already exists');
         statusRequest=StatusRequest.failure;
       }

     }
     update();
     //Get.offNamed(AppRoute.verifyEmailCode);
    // Get.delete<SignUpControllerImp>();
   }else{

   }


  }

}