import 'package:get/get.dart';
import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';



class ResetPasswordData{
  // SignUpControllerImp controller=Get.find();
  Crud crud;
  ResetPasswordData(this.crud);
  postData(String email,String password )async{
    var response=await crud.postData(AppLinkApi.resetPassword, {
      "email":email ,
      "password":password,

    });
    return response.fold((l) => l, (r) => r);
  }
}