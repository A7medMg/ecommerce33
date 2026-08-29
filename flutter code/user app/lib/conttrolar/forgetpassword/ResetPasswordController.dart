import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/data/datasource/remote/forgetpassword/resetpassword.dart';

import '../../core/functions/handlingDataController.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToSuccess();
}
class ResetPasswordControllerImp extends ResetPasswordController{
  late TextEditingController password;
  late TextEditingController confirmpassword;
  StatusRequest  statusRequest=StatusRequest.none;
  ResetPasswordData resetPasswordData=ResetPasswordData(Get.find());
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  String ? email;
  @override
  void onInit() {
    password=TextEditingController();
    confirmpassword=TextEditingController();
    email=Get.arguments['email'];
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    confirmpassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  resetPassword() {

  }

  @override
  goToSuccess() async
  {
    if(password.text != confirmpassword.text)return Get.defaultDialog(title: 'Warning',middleText: 'password not match');
    if(formstate.currentState!.validate()){
      statusRequest= StatusRequest.loading;
      update();
      var response= await resetPasswordData.postData(email!,password.text);
      statusRequest=handlingData(response);
      if(statusRequest == StatusRequest.success){

        if(response['status']=='success'){
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.success_Screen_Reset);
        }else{
          Get.defaultDialog(title: "Warning",middleText: ' Try again');
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