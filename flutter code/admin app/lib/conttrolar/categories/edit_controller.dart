import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopadmin/conttrolar/categories/view_controller.dart';
import 'package:shopadmin/core/classes/statusrequest.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';
import 'package:shopadmin/data/datasource/remote/categoriesData/view.dart';
import 'package:shopadmin/data/datasource/remote/test_data.dart';
import 'package:shopadmin/data/model/CategoriesModel.dart';

import '../../core/functions/handlingDataController.dart';
import '../../core/functions/uploadFile.dart';



class CategoriesAdminEditController extends GetxController{

  CategoriesDataAdmin categoriesDataAdmin=CategoriesDataAdmin(Get.find());
   File?  file;
  CategoriesModel ? categoriesModel;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  late  TextEditingController  name;
  late  TextEditingController  namear;
  StatusRequest statusRequest= StatusRequest.none;
  @override
  void onInit() {
    categoriesModel=Get.arguments['categoriesModel'];
    name=TextEditingController();
    namear=TextEditingController();
    name.text=categoriesModel!.categoriesName!.toString();
    namear.text=categoriesModel!.categoriesNameAr!.toString();

    super.onInit();
  }
  chooseImage()async{
    file= await fileUploadGallery(true);
    update();
  }


  editData()async{
    if(formstate.currentState!.validate()){
     // if(file == null) Get.snackbar("error", "Please choose svg image");

      statusRequest= StatusRequest.loading;
      update();
      Map data={

        'name':name.text,
        'namear':namear.text,
        'imageold':categoriesModel!.categoriesImage.toString(),
        'id':categoriesModel!.categoriesId.toString()



      };
      var response= await categoriesDataAdmin.editData(data,file);
      statusRequest=handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status']=='success'){
          Get.offNamed(AppRoute.categoriesView);
          CategoriesAdminViewController c=Get.find();
          c.getData();
        }else{
          statusRequest=StatusRequest.failure;
        }

      }
      update();
    }

  }


}