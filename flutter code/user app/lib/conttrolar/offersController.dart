import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/HomeController.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/data/datasource/remote/offersData.dart';
import 'package:shoppapp/data/datasource/remote/test_data.dart';
import 'package:shoppapp/data/model/itemsmodel.dart';

import '../core/functions/handlingDataController.dart';

class OffersItemsController extends SearchMixController{

  OffersData offersData=OffersData(Get.find());
  List<ItemsModel> data=[];
  late StatusRequest statusRequest;
  getData()async{
    data.clear();

    statusRequest= StatusRequest.loading;
    update();
    var response= await offersData.getData();
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        List dataList22=response['data'];
       data.addAll(dataList22.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();
  }
  goToProductDetails( itemsModel) {
    Get.toNamed("productDetails",arguments: {"itemsModel":itemsModel});
  }
  @override
  void onInit() {

    // TODO: implement onInit
    getData();
    search=TextEditingController();
    super.onInit();
  }
}