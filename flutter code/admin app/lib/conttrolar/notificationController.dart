import 'package:get/get.dart';
import 'package:shopadmin/core/classes/statusrequest.dart';
import 'package:shopadmin/core/services/services.dart';
import 'package:shopadmin/data/datasource/remote/notificationData.dart';


import '../core/functions/handlingDataController.dart';

class NotificationController extends GetxController{

  NotificationData notificationData=NotificationData(Get.find());
  MyServices myServices=Get.find();
  List data=[];
  late StatusRequest statusRequest;
  getData()async{
    statusRequest= StatusRequest.loading;
    var response= await notificationData.getData(myServices.sharedPreferences.getString("id")!);
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
    getData();


    super.onInit();
  }
}