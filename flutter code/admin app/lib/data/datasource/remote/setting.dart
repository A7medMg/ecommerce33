import 'package:get/get.dart';
import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';



class SettingData{
  // SignUpControllerImp controller=Get.find();
  Crud crud;
  SettingData(this.crud);
  postData(String title,String body )async{
    var response=await crud.postData(AppLinkApi.settingAdmin, {
      "title":title ,
      "body":body,

    });
    return response.fold((l) => l, (r) => r);
  }
}