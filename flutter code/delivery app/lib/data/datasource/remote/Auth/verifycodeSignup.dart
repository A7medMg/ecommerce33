import 'package:get/get.dart';
import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';



class VerifyCodeSignU{
  // SignUpControllerImp controller=Get.find();
  Crud crud;
  VerifyCodeSignU(this.crud);
  postData(String email,String verifyCode )async{
    var response=await crud.postData(AppLinkApi.verifyCode, {
      "email":email ,
      "verifycode":verifyCode,


    });
    return response.fold((l) => l, (r) => r);
  }
  reSendData(String email)async{
    var response=await crud.postData(AppLinkApi.reSendCode, {
      "email":email ,



    });
    return response.fold((l) => l, (r) => r);
  }
}