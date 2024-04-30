import 'package:get/get.dart';
import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';



class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postData(String email ,String verifycode) async {
    var response = await crud.postData(AppLinkApi.verifyCodeForget, {
      "email" : email ,
      "verifycode" : verifycode
    });
    return response.fold((l) => l, (r) => r);
  }
}