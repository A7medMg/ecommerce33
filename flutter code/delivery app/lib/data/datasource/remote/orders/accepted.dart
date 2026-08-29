import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class OrdersacceptedData{
  Crud crud;
  OrdersacceptedData(this.crud);
  getData(String deliveryId)async{
    var response=await crud.postData(AppLinkApi.ordersAccepted, {
      "id":deliveryId

    });
    return response.fold((l) => l, (r) => r);
  }
  ordersDone(String ordersid,String usersid)async{
    var response=await crud.postData(AppLinkApi.done, {
      "ordersid":ordersid,
      "usersid":usersid



    });
    return response.fold((l) => l, (r) => r);
  }
  
}