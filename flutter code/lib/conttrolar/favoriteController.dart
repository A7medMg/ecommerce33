import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/data/datasource/remote/favoriteData.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/handlingDataController.dart';
import '../core/services/services.dart';

class FavoriteController extends GetxController{
  FavoriteData favoriteData = FavoriteData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices=Get.find();


  List data = [];

  Map isFavorite={};
  setFavorite(id,val){
    isFavorite[id]=val;
    update();
  }
  addFavorite(String itemsId)async{
    data.clear();
    statusRequest= StatusRequest.loading;
    var response= await favoriteData.addFavorite(myServices.sharedPreferences.getString("id")!,itemsId);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        Get.rawSnackbar(title:"notification", messageText:const Text("operation accomplished successfully"));
        //data.addAll(response['data']);
      }else{
        statusRequest=StatusRequest.failure;
      }

    }


  }
  deleteFavorite(String itemsId)async{
    data.clear();
    statusRequest= StatusRequest.loading;
    var response= await favoriteData.deleteFavorite(myServices.sharedPreferences.getString("id")!,itemsId);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        Get.rawSnackbar(title:"notification", messageText:const Text("operation accomplished successfully"));

        //data.addAll(response['data']);
      }else{
        statusRequest=StatusRequest.failure;
      }

    }

  }

}