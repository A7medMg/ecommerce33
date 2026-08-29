import 'package:get/get.dart';
import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';



class CheckEmailData{
  // SignUpControllerImp controller=Get.find();
  Crud crud;
  CheckEmailData(this.crud);
  postData(String email )async{
    var response=await crud.postData(AppLinkApi.checkEmail, {
      "email":email ,


    });
    return response.fold((l) => l, (r) => r);
  }
}