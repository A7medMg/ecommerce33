import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkApi.homePage, {

    });
    return response.fold((l) => l, (r) => r);
  }
  searchData(String search)async{
    var response=await crud.postData(AppLinkApi.search, {
      "search":search

    });
    return response.fold((l) => l, (r) => r);
  }
}