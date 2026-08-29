import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';

class OrdersPendingData{
  Crud crud;
  OrdersPendingData(this.crud);
  getData(String usersid)async{
    var response=await crud.postData(AppLinkApi.pendingOrders, {
      "usersid":usersid

    });
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String orderid)async{
    var response=await crud.postData(AppLinkApi.deleteOrders, {
      "id":orderid

    });
    return response.fold((l) => l, (r) => r);
  }
}