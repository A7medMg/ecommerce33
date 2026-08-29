import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';

class OffersData{
  Crud crud;
  OffersData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkApi.offers, {

    });
    return response.fold((l) => l, (r) => r);
  }
}