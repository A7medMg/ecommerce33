import 'dart:io';

import 'package:shopadmin/core/classes/crud.dart';
import 'package:shopadmin/linkapi.dart';

class ItemsDataAdmin{
  Crud crud;
  ItemsDataAdmin(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkApi.itemsAdminView, {

    });
    return response.fold((l) => l, (r) => r);
  }
  addData(Map data,File file)async{
    var response=await crud.addRequestWithImageOne(AppLinkApi.itemsAdminAdd, data,file);
    return response.fold((l) => l, (r) => r);
  }
  deleteData(Map data)async{
    var response=await crud.postData(AppLinkApi.itemsAdminDelete,data);
    return response.fold((l) => l, (r) => r);
  }
  editData(Map data,[File ? file])async{
    var response;
    if(file == null){
      response=await crud.postData(AppLinkApi.categoriesAdminEdit, data);
    }else{
      response=await crud.addRequestWithImageOne(AppLinkApi.itemsAdminEdit, data,file);
    }

    return response.fold((l) => l, (r) => r);
  }
}