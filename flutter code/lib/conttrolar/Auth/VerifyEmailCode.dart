import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';

import '../../core/functions/handlingDataController.dart';
import '../../data/datasource/remote/Auth/verifycodeSignup.dart';
/////////SingUp Screen ........./////////////
abstract class VerifyEmailCode extends GetxController{
  checkCode();
  goSuccessScreen(String verfiyCodeSignUp);
  reSend();
}
class VerifyEmailCodeImp extends VerifyEmailCode{
  VerifyCodeSignU  verifyCodeSignU =VerifyCodeSignU(Get.find());

  String ? email;
  StatusRequest  statusRequest=StatusRequest.none;
  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }


  @override
  checkCode() {

  }

  @override
  goSuccessScreen(verfiyCodeSignUp) async{
    statusRequest= StatusRequest.loading;
    update();
    var response= await verifyCodeSignU.postData(email!,verfiyCodeSignUp);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        //data.addAll(response['data']);
        Get.offNamed(AppRoute.successScreenEmail);
      }else{
        Get.defaultDialog(title: "Warning",middleText: 'phone or email already exists');
        statusRequest=StatusRequest.failure;
      }

    }
    update();

  }
  reSend(){
    verifyCodeSignU.reSendData(email!);
  }

}