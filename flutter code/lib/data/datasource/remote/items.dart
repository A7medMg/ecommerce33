import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';

class ItemData{
  Crud crud;
  ItemData(this.crud);
  getData(String id,String usersId)async{
    var response=await crud.postData(AppLinkApi.items, {
      "id":id.toString(),
      "usersid":usersId
    });
    return response.fold((l) => l, (r) => r);
  }
}