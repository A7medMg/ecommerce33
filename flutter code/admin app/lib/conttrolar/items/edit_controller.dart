import 'dart:io';


import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopadmin/conttrolar/categories/view_controller.dart';
import 'package:shopadmin/conttrolar/items/view_controller.dart';
import 'package:shopadmin/core/classes/statusrequest.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';
import 'package:shopadmin/data/datasource/remote/categoriesData/view.dart';
import 'package:shopadmin/data/datasource/remote/test_data.dart';
import 'package:shopadmin/data/model/CategoriesModel.dart';
import 'package:shopadmin/data/model/itemsmodel.dart';

import '../../core/functions/handlingDataController.dart';
import '../../core/functions/uploadFile.dart';
import '../../data/datasource/remote/itemDataAdmin.dart';



class ItemsAdminEditController extends GetxController{

  ItemsDataAdmin itemsDataAdmin=ItemsDataAdmin(Get.find());
  File ? file;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  List<SelectedListItem> dropDownList=[];
  late  TextEditingController  dropdowmname;
  late  TextEditingController  dropdownid;
  late  TextEditingController  name;
  late  TextEditingController  namear;
  late  TextEditingController  desc;
  late  TextEditingController  descAr;
  late  TextEditingController  price;
  late  TextEditingController  count;
  late  TextEditingController  discount;
  late  TextEditingController  catid;
  late  TextEditingController  catName;
  ItemsModel ?itemsModel;
  String ?active ;
  StatusRequest statusRequest= StatusRequest.none;
  @override
  void onInit() {
    itemsModel=Get.arguments['itemsModel'];
    name=TextEditingController();
    namear=TextEditingController();
    desc=TextEditingController();
    descAr=TextEditingController();
    price=TextEditingController();
    count=TextEditingController();
    discount=TextEditingController();
    dropdowmname=TextEditingController();
    dropdownid=TextEditingController();
    catid=TextEditingController();
    catName=TextEditingController();
    name.text=itemsModel!.itemsName!.toString();
    namear.text=itemsModel!.itemsNameAr!.toString();
    desc.text=itemsModel!.itemsDesc!.toString();
    descAr.text=itemsModel!.itemsDescAr!.toString();
    price.text=itemsModel!.itemsPrice!.toString();
    discount.text=itemsModel!.itemsDiscount!.toString();
    count.text=itemsModel!.itmesCount!.toString();
    catid.text=itemsModel!.categoriesId!.toString();
    catName.text=itemsModel!.categoriesName!.toString();
    active=itemsModel!.itemsActive.toString();

    super.onInit();
  }
  chooseImage()async{
    file= await fileUploadGallery(false);
    update();
  }
changStatusActive(val){
    active=val;
    update();
}

  editData()async{
    if(formstate.currentState!.validate()){
     // if(file == null) Get.snackbar("error", "Please choose svg image");

      statusRequest= StatusRequest.loading;
      update();
      Map data={
        'id':itemsModel!.itemsId.toString(),
        'imageold':itemsModel!.itemsImage,
        'active':active,
        'name':name.text,
        'namear':namear.text,
        'desc':desc.text,
        'descar':descAr.text,
        'count':count.text,
        'price':price.text,
        'discount':discount.text,
        'catid':catid.text,
        'datenow':DateTime.now().toString(),



      };
      var response= await itemsDataAdmin.editData(data,file);
      statusRequest=handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status']=='success'){
          Get.offNamed(AppRoute.itemsView);
          ItemsAdminViewController c=Get.find();
          c.getData();
        }else{
          statusRequest=StatusRequest.failure;
        }

      }
      update();
    }

  }


}