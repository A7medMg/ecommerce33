import 'dart:io';


import 'package:drop_down_list/drop_down_list.dart';
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

import '../../core/functions/handlingDataController.dart';
import '../../core/functions/uploadFile.dart';
import '../../data/datasource/remote/itemDataAdmin.dart';



class ItemsAdminAddController extends GetxController{

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

   StatusRequest statusRequest= StatusRequest.none;
  @override
  void onInit() {
    getCategory();
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



    super.onInit();
  }
  getCategory()async{
    CategoriesDataAdmin categoriesDataAdmin=CategoriesDataAdmin(Get.find());
    List <CategoriesModel>data=[];
    statusRequest= StatusRequest.loading;
    update();
    var response= await categoriesDataAdmin.getData();
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        List dataList=response['data'];
        data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));
        for(int i=0;i<data.length;i++){
          dropDownList.add(SelectedListItem(name: data[i].categoriesName!,value: data[i].categoriesId.toString()));
        }
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();
  }

  showOptionimage(){
    showbottommenu(chooseImageCamera,chooseImageGallery);
  }
  chooseImageCamera()async{
    file= await imageUploadCamera();
    update();
  }
  chooseImageGallery()async{
    file= await fileUploadGallery(false);
    update();
  }


  addData()async{
    if(formstate.currentState!.validate()){
      if(file == null) Get.snackbar("error", "Please choose  image");

      statusRequest= StatusRequest.loading;
      update();
      Map data={

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
      var response= await itemsDataAdmin.addData(data,file!);
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

  showDownListModel(context){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name: 'a'),SelectedListItem(name: 'b')],
        selectedItems: (List<dynamic> selectedList) {
         SelectedListItem selectedListItem=selectedList[0];
         dropdowmname.text=selectedListItem.name;
          }
          //showSnackBar(list.toString());

       // enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

}