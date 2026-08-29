import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class NotificationData{
  Crud crud;
  NotificationData(this.crud);
  getData(String usersId)async{
    var response=await crud.postData(AppLinkApi.notification, {
    "id":usersId
    });
    return response.fold((l) => l, (r) => r);
  }
}