import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class OrdersDetailData{
  Crud crud;
  OrdersDetailData(this.crud);
  getData(String id)async{
    var response=await crud.postData(AppLinkApi.ordersDetails, {
      "id":id

    });
    return response.fold((l) => l, (r) => r);
  }
}