import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class UsersData{
  Crud crud;
  UsersData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkApi.usersAdminView, {

    });
    return response.fold((l) => l, (r) => r);
  }
}