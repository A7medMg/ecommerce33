import '../../../core/classes/crud.dart';
import '../../../linkapi.dart';
class AddressData {
  Crud crud;
  AddressData(this.crud);
  getData(String usersid) async {
    var response =
    await crud.postData(AppLinkApi.viewAddress, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLinkApi.addAddress, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
    await crud.postData(AppLinkApi.deleteAddress, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}