import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class OrdersacceptedData{
  Crud crud;
  OrdersacceptedData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkApi.viewAcceptedordersAdmin, {


    });
    return response.fold((l) => l, (r) => r);
  }
  donePrepare(String ordersid,String usersid,String ordersType)async{
    var response=await crud.postData(AppLinkApi.ordersprepareAdmin, {
      "ordersid":ordersid,
      "usersid":usersid,
      "ordertype":ordersType



    });
    return response.fold((l) => l, (r) => r);
  }
  
}