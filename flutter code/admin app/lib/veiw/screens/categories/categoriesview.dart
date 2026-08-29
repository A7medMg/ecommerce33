import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopadmin/conttrolar/categories/view_controller.dart';
import 'package:shopadmin/core/classes/handlingDataView.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';
import 'package:shopadmin/linkapi.dart';

import '../../../core/consstans/color/colorapp.dart';

class CategoriesAdminView extends StatelessWidget {
  const CategoriesAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesAdminViewController controller=Get.put(CategoriesAdminViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.toNamed(AppRoute.categoriesAdd);
      },child: Icon(Icons.add),backgroundColor: Colorapp.primaryColor,),
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body:GetBuilder<CategoriesAdminViewController>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: WillPopScope(onWillPop:(){
        return controller.myBack();
      },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context,index)=>InkWell(
                onTap: (){
                  controller.goToPageEdit(controller.data[index]);
                },
                child: Card(child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: SvgPicture.network(

                              "${AppLinkApi.staticImageCategories}/${controller.data[index].categoriesImage}",height: 90,),
                        )),
                    Expanded(
                        flex: 3,
                        child: ListTile(
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(icon: Icon(Icons.delete_outline),onPressed: (){
                                Get.defaultDialog(title: "warring",middleText: "are ypu sure delete this items",onCancel: (){},onConfirm: (){
                                  controller.deleteCategories(controller.data[index].categoriesId.toString(),controller.data[index].categoriesImage.toString());
                                  Get.back();

                                });
                              },),


                            ],
                          ),
                          subtitle:Text(controller.data[index].categoriesDatetime!) ,
                          title: Text(controller.data[index].categoriesName!),))
                  ],
                )),
              )),),
      )),),
    );
  }
}
