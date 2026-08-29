import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/cartController.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/handlingDataController.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cartData.dart';
import '../data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices=Get.find();


 // CartController cartController=Get.put(CartController());
  late ItemsModel itemsModel;

  List subItems = [
    {"name": "red", "id": 1, "active": "1"},
    {"name": "blue", "id": 2, "active": "0"},
    {"name": "black", "id": 3, "active": "0"}
  ];
  int countitems=0;

  intialData()async {
    statusRequest=StatusRequest.loading;
    itemsModel = Get.arguments["itemsModel"];
    countitems= int.parse(await  getItemsCountFromCart(itemsModel.itemsId!.toString()));
  statusRequest=StatusRequest.success;
  update();
  }
  getItemsCountFromCart(String itemsId)async{

    statusRequest= StatusRequest.loading;
    //update();
    var response= await cartData.getCountCart(myServices.sharedPreferences.getString("id")!,itemsId);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        String itemsCount="0";
        itemsCount=response['data'].toString();
        print(itemsCount);
        return itemsCount;

      }else{
        statusRequest=StatusRequest.failure;
      }

    }


  }
  add(){
    addToCart(
        itemsModel.itemsId!.toString());
    countitems++;
    update();
  }
 minus(){
    if(countitems >0){
      deleteFromCart(
          itemsModel.itemsId!.toString());
      countitems--;
      update();
    }
 }
  addToCart(String itemsId)async{

    statusRequest= StatusRequest.loading;
    update();
    var response= await cartData.addCart(myServices.sharedPreferences.getString("id")!,itemsId);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        Get.rawSnackbar(title:"notification", messageText:const Text("operation accomplished successfully"));
        //data.addAll(response['data']);
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();

  }
  deleteFromCart(String itemsId)async{

    statusRequest= StatusRequest.loading;
    update();
    var response= await cartData.deleteCart(myServices.sharedPreferences.getString("id")!,itemsId);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        Get.rawSnackbar(title:"notification", messageText:const Text("operation accomplished successfully"));
        //data.addAll(response['data']);
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();

  }

  @override
  void onInit() {
    // TODO: implement onInit

    intialData();
    super.onInit();
  }
}
