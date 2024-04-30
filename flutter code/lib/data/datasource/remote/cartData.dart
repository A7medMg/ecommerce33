import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';

class CartData{
  Crud crud;
  CartData(this.crud);
  addCart(String usersId,String itemsId)async{
    var response=await crud.postData(AppLinkApi.cartAdd, {
      "usersid":usersId,
      "itemsid":itemsId
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteCart(String usersId,String itemsId)async{
    var response=await crud.postData(AppLinkApi.cartDelete, {
      "usersid":usersId,
      "itemsid":itemsId
    });
    return response.fold((l) => l, (r) => r);
  }
 getCountCart(String usersId,String itemsId)async{
    var response=await crud.postData(AppLinkApi.cartItemsCount, {
      "usersid":usersId,
      "itemsid":itemsId
    });
    return response.fold((l) => l, (r) => r);
  }
  viewCart(String usersId)async{
    var response=await crud.postData(AppLinkApi.cartView, {
      "usersid":usersId,

    });
    return response.fold((l) => l, (r) => r);
  }

}