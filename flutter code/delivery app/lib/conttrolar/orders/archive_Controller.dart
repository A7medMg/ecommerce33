import 'package:get/get.dart';
import 'package:shopadmin/data/datasource/remote/orders/pending_data.dart';
import 'package:shopadmin/data/model/ordersModel.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/functions/handlingDataController.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/archive.dart';

class OrdersArchiveController extends GetxController{
  ArchiveOrdersData archiveOrdersData = ArchiveOrdersData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices=Get.find();


  List<OrdersModel> data = [];
  @override
  void onInit() {
    getOrders();
    // TODO: implement onInit
    super.onInit();
  }
  String printOrdersType(String val){
    if(val == "0"){
      return "delivery";
    }else{
      return "Recive";
    }

  }
  String printPaymentMethod(String val){
    if(val == "0"){
      return "Cash On Delivery";
    }else{
      return "Payment card";
    }
  }
  String printOrdersStatus(String val){
    if(val == "0"){
      return "pending Approval";
    }else if(val == "1"){
      return "The order is being Prepared";
    }else if(val == "2"){
      return "ready to picked up by delivery man";
    }else if(val == "3"){
      return "on the way";
    } else{
      return "Archive";
    }
  }
submitRating(String orderId,double rating, String comment)async{
   data.clear();
    statusRequest= StatusRequest.loading;
    update();
    var response= await archiveOrdersData.rating(comment,orderId,rating.toString());
    // print(response);
    statusRequest=handlingData(response);

    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
      
        getOrders();
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();
  
}
  getOrders()async{
    data.clear();
    statusRequest= StatusRequest.loading;
    update();
    var response= await archiveOrdersData.getData(myServices.sharedPreferences.getString("id")!);
    // print(response);
    statusRequest=handlingData(response);

    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        List listdata=response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
        
        // print("/////////////////////////////////////////////////////");
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();
  }

  refreshOrders(){
    getOrders();
  }


}