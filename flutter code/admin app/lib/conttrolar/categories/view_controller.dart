import 'package:get/get.dart';
import 'package:shopadmin/core/classes/statusrequest.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';
import 'package:shopadmin/data/datasource/remote/categoriesData/view.dart';
import 'package:shopadmin/data/datasource/remote/test_data.dart';
import 'package:shopadmin/data/model/CategoriesModel.dart';

import '../../core/functions/handlingDataController.dart';



class CategoriesAdminViewController extends GetxController{

  CategoriesDataAdmin categoriesDataAdmin=CategoriesDataAdmin(Get.find());
  List <CategoriesModel>data=[];
  late StatusRequest statusRequest;
  getData()async{
    data.clear();
    statusRequest= StatusRequest.loading;
    update();
    var response= await categoriesDataAdmin.getData();
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
     List dataList=response['data'];
     data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();
  }
  deleteCategories(String id,String imageName){
    categoriesDataAdmin.deleteData({
      'id':id,
      'imagename':imageName
    });
    data.removeWhere((element)=>element.categoriesId==id);
    update();
  }
  goToPageEdit(CategoriesModel categoriesModel){
    Get.toNamed(AppRoute.categoriesEdite,arguments:{
      'categoriesModel':categoriesModel
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