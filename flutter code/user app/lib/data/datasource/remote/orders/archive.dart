import 'package:shoppapp/core/classes/crud.dart';
import 'package:shoppapp/linkapi.dart';

class ArchiveOrdersData {
  Crud crud;

  ArchiveOrdersData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLinkApi.archiveOrders, {
      "id": usersid
    });
    return response.fold((l) => l, (r) => r);
  }
  rating(String comment,String orderId,String rating) async {
    var response = await crud.postData(AppLinkApi.rating, {
      "id": orderId,
      "rating": rating,
      "comment": comment,

    });
    return response.fold((l) => l, (r) => r);
  }
}