import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/core/services/services.dart';
import 'package:shoppapp/data/datasource/remote/home_data.dart';
import 'package:shoppapp/data/model/itemsmodel.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/handlingDataController.dart';

abstract class HomeController extends SearchMixController  {
  initialData();
  goToItems(List categories,int selectedCate,String categoriesId);
  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String ? lang;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];




  StatusRequest statusRequest = StatusRequest.none;


  @override
  initialData() {
    lang=myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search=TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  @override
  goToItems( categories, selectedCate,categoriesId) {
    Get.toNamed(AppRoute.items,arguments: {
      "categories":categories,
      "selectedCate":selectedCate,
      "categoriesId":categoriesId
    });
  }
  goToProductDetails( itemsModel) {
    Get.toNamed("productDetails",arguments: {"itemsModel":itemsModel});
  }
}
class SearchMixController extends GetxController {
  List<ItemsModel> listData = [];

  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        listData.clear();
        List responseData =response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val){
    if(val ==""){
      statusRequest=StatusRequest.none;
      isSearch=false;
    }
    update();
  }
  onSearchItems(){
    isSearch=true;
    searchData();
    update();
  }
}