import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/data/datasource/remote/forgetpassword/verifycode.dart';

import '../../core/functions/handlingDataController.dart';


abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
  VerifyCodeForgetPasswordData(Get.find());

  StatusRequest  statusRequest=StatusRequest.none;

  @override
  checkCode() {
    Get.offNamed(AppRoute.resetPassword , arguments: {
      "email" : email
    });
  }

  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
    await verifyCodeForgetPasswordData.postData(email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword , arguments: {
          "email" : email
        });
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {

    email = Get.arguments['email'];
    super.onInit();
  }
}