import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';

class Testdata{
  Crud crud;
  Testdata(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkApi.test, {

    });
   return response.fold((l) => l, (r) => r);
  }
}