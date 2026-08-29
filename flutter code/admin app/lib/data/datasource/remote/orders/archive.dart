import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class ArchiveOrdersData {
  Crud crud;

  ArchiveOrdersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLinkApi.archiveAdmin, {

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