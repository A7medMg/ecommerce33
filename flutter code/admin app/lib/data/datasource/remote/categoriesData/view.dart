import 'dart:io';

import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class CategoriesDataAdmin{
  Crud crud;
  CategoriesDataAdmin(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkApi.categoriesAdminView, {

    });
    return response.fold((l) => l, (r) => r);
  }
  addData(Map data,File file)async{
    var response=await crud.addRequestWithImageOne(AppLinkApi.categoriesAdminAdd, data,file);
    return response.fold((l) => l, (r) => r);
  }
  deleteData(Map data)async{
    var response=await crud.postData(AppLinkApi.categoriesAdminDelete,data);
    return response.fold((l) => l, (r) => r);
  }
  editData(Map data,[File ? file])async{
    var response;
    if(file == null){
      response=await crud.postData(AppLinkApi.categoriesAdminEdit, data);
    }else{
      response=await crud.addRequestWithImageOne(AppLinkApi.categoriesAdminEdit, data,file);
    }

    return response.fold((l) => l, (r) => r);
  }
}