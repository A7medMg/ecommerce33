import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';

class FavoriteData{
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String usersId,String itemsId)async{
    var response=await crud.postData(AppLinkApi.favoriteAdd, {
      "usersId":usersId,
      "itemsId":itemsId
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteFavorite(String usersId,String itemsId)async{
    var response=await crud.postData(AppLinkApi.favoriteRemove, {
      "usersId":usersId,
      "itemsId":itemsId
    });
    return response.fold((l) => l, (r) => r);
  }

}