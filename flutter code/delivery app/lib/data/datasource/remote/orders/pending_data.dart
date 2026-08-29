import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class OrdersPendingData{
  Crud crud;
  OrdersPendingData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkApi.pendingOrders, {
    

    });
    return response.fold((l) => l, (r) => r);
  }
   approveData(String deliveryid,String userid,String orderid)async{
    var response=await crud.postData(AppLinkApi.ordersAprove, {
    "deliveryid":deliveryid,
     "usersid":userid,
    "ordersid":orderid


    });
    return response.fold((l) => l, (r) => r);
  }
  
}