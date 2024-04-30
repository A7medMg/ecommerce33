import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';

class MyFavoriteView{
  Crud crud;
  MyFavoriteView(this.crud);
  getData(String id)async{
    var response=await crud.postData(AppLinkApi.favoriteView, {
      "id":id,

    });
    return response.fold((l) => l, (r) => r);
  }
  deleteData(int id)async{
    var response=await crud.postData(AppLinkApi.deletfromfavorite, {
      "id":id,

    });
    return response.fold((l) => l, (r) => r);
  }
}