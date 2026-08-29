import 'package:get/get.dart';
import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';



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