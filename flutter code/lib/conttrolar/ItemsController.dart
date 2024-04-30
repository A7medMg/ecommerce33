import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/services/services.dart';
import 'package:shoppapp/data/datasource/remote/items.dart';
import 'package:shoppapp/data/model/itemsmodel.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/handlingDataController.dart';
import 'HomeController.dart';

abstract class ItemsController extends GetxController{
  initData();
  changeSelectedCate(int val,String catval);
  getData(String categoryid);
  goToProductDetails(ItemsModel itemsModel);
}
class ItemsControllerImp extends SearchMixController{
  ItemData itemData = ItemData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices=Get.find();


  List data = [];
  List categories=[];
  int ? selectedCate;
  String ? catid;
  @override
  initData() {
    categories=Get.arguments["categories"];
    selectedCate=Get.arguments["selectedCate"];
    catid=Get.arguments["categoriesId"];

    getData(catid!);
  }
  @override
  void onInit() {
    search=TextEditingController();
   initData();
    super.onInit();
  }

  @override
  changeSelectedCate(val,catval) {
    selectedCate=val;
    catid=catval;
    getData(catid!);

    update();
    // TODO: implement changeSelectedCate
    throw UnimplementedError();
  }

  @override
  getData(categoryid)async{
    data.clear();
    statusRequest= StatusRequest.loading;
    var response= await itemData.getData(categoryid,myServices.sharedPreferences.getString("id")!);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        data.addAll(response['data']);
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();
  }
  @override
  goToProductDetails( itemsModel) {
   Get.toNamed("productDetails",arguments: {"itemsModel":itemsModel});
  }
}