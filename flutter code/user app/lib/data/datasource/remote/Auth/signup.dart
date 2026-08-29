import 'package:get/get.dart';
import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';



class SignupData{
 // SignUpControllerImp controller=Get.find();
  Crud crud;
  SignupData(this.crud);
  postData(String username,String email,String password,String phone )async{
    var response=await crud.postData(AppLinkApi.signUp, {
      "username":username,
      "email":email ,
      "password":password,
      "phone":phone,

    });
    return response.fold((l) => l, (r) => r);
  }
}