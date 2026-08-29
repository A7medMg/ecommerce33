import 'package:get/get.dart';
import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';



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