import 'package:get/get.dart';
import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';



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