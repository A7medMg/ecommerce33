import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class OrdersPendingData{
  Crud crud;
  OrdersPendingData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkApi.viewPendingordersAdmin, {
    

    });
    return response.fold((l) => l, (r) => r);
  }
   approveData(String userid,String orderid)async{
    var response=await crud.postData(AppLinkApi.ordersAproveAdmin, {

     "usersid":userid,
    "ordersid":orderid


    });
    return response.fold((l) => l, (r) => r);
  }
  
}