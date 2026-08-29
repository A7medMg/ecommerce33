import 'package:get/get.dart';
import 'package:shopadmin/core/classes/statusrequest.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';
import 'package:shopadmin/data/datasource/remote/categoriesData/view.dart';
import 'package:shopadmin/data/datasource/remote/test_data.dart';
import 'package:shopadmin/data/model/CategoriesModel.dart';
import 'package:shopadmin/data/model/itemsmodel.dart';

import '../../core/functions/handlingDataController.dart';
import '../../data/datasource/remote/itemDataAdmin.dart';



class ItemsAdminViewController extends GetxController{

  ItemsDataAdmin itemsDataAdmin=ItemsDataAdmin(Get.find());
  List <ItemsModel>data=[];
  late StatusRequest statusRequest;
  getData()async{
    data.clear();
    statusRequest= StatusRequest.loading;
    update();
    var response= await itemsDataAdmin.getData();
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
     List dataList=response['data'];
     data.addAll(dataList.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();
  }
  deleteItems(String id,String imageName){
    itemsDataAdmin.deleteData({
      'id':id,
      'imagename':imageName
    }
    );
    data.removeWhere((element)=>element.itemsId==id);
    getData();
    update();
  }
  goToPageEdit(ItemsModel itemsModel){
    Get.toNamed(AppRoute.itemsEdite,arguments:{
      'itemsModel':itemsModel
    } );
  }
  myBack(){
    Get.offAllNamed(AppRoute.Home);
    return Future.value(false);
  }
  @override
  void onInit() {

    // TODO: implement onInit
    getData();
    super.onInit();
  }
}