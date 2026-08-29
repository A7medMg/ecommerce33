import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class Testdata{
  Crud crud;
  Testdata(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkApi.test, {

    });
   return response.fold((l) => l, (r) => r);
  }
}