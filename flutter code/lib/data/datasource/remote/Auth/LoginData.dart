import 'package:get/get.dart';
import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';



class LoginData{
  // SignUpControllerImp controller=Get.find();
  Crud crud;
  LoginData(this.crud);
  postData(String email,String password )async{
    var response=await crud.postData(AppLinkApi.logIn, {
      "email":email ,
      "password":password,

    });
    return response.fold((l) => l, (r) => r);
  }
}