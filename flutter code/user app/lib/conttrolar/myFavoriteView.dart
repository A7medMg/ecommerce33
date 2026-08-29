import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/data/datasource/remote/favoriteData.dart';

import '../core/classes/statusrequest.dart';
import '../core/consstans/namesRout.dart';
import '../core/functions/handlingDataController.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/myFavoirteView.dart';
import '../data/model/myFavoriteModel.dart';

class FavoriteViewController extends GetxController {
  MyFavoriteView myFavoriteView = MyFavoriteView(Get.find());
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  List<MyfavoriteModel> data = [];

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteView
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];

        data.addAll(responsedata.map((e) => MyfavoriteModel.fromJson(e)));

        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
  }

    deleteDataFromFavorite(String favoriteid) {
    //data.clear();

    var response = myFavoriteView.deleteData(favoriteid);

    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
    update();
  }
}
