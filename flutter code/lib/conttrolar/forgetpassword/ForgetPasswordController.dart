import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/data/datasource/remote/forgetpassword/checkemail.dart';

import '../../core/functions/handlingDataController.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
  goToVerfiyCode();
}
class ForgetPasswordControllerImp extends ForgetPasswordController{
 late TextEditingController email;
 StatusRequest  statusRequest=StatusRequest.none;
 CheckEmailData checkEmailData=CheckEmailData(Get.find());
 GlobalKey<FormState>formstate=GlobalKey<FormState>();
 @override
  void onInit() {
   email=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
   email.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  checkEmail() async{
      if(formstate.currentState!.validate()){
    statusRequest= StatusRequest.loading;
    update();
    var response= await checkEmailData.postData(email.text);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        //data.addAll(response['data']);
        Get.offNamed(AppRoute.verifycode, arguments: {
          'email': email.text
        });
      } else {
        Get.defaultDialog(title: "Warning", middleText: ' email  not exists');
        statusRequest = StatusRequest.failure;
      }
      update();
    }
    }

    //Get.offNamed(AppRoute.verifyEmailCode);
    // Get.delete<SignUpControllerImp>();
   }

  @override
  goToVerfiyCode() {
    // TODO: implement goToVerfiyCode
    throw UnimplementedError();
  }
  }

