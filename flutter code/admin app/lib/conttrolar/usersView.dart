import 'package:get/get.dart';
import 'package:shopadmin/core/classes/statusrequest.dart';
import 'package:shopadmin/data/datasource/remote/test_data.dart';

import '../core/functions/handlingDataController.dart';
import '../data/datasource/remote/viewUsers.dart';

class UsersAdminViewController extends GetxController{

  UsersData usersData=UsersData(Get.find());
  List data=[];
  late StatusRequest statusRequest;
  getData()async{
    statusRequest= StatusRequest.loading;
    var response= await usersData.getData();
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        data.addAll(response['data']);
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();
  }
  @override
  void onInit() {

    // TODO: implement onInit
    getData();
    super.onInit();
  }
}