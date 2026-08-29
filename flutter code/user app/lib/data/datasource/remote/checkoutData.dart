import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';

class CheckoutData{
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map data)async{
    var response=await crud.postData(AppLinkApi.checkout,data);
    return response.fold((l) => l, (r) => r);
  }
}