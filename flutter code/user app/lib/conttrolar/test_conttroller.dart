import 'package:get/get.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/data/datasource/remote/test_data.dart';

import '../core/functions/handlingDataController.dart';

class TestController extends GetxController{

  Testdata testdata=Testdata(Get.find());
  List data=[];
  late StatusRequest statusRequest;
  getData()async{
    statusRequest= StatusRequest.loading;
    var response= await testdata.getData();
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