import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopadmin/conttrolar/categories/view_controller.dart';
import 'package:shopadmin/core/classes/handlingDataView.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';
import 'package:shopadmin/linkapi.dart';

import '../../../conttrolar/items/view_controller.dart';
import '../../../core/consstans/color/colorapp.dart';
import '../../conttrolar/usersView.dart';

class UsersAdminView extends StatelessWidget {
  const UsersAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    UsersAdminViewController controller=Get.put(UsersAdminViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Uers"),
      ),
      body:GetBuilder<UsersAdminViewController>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context,index){

              return InkWell(
                onTap: (){
                  //controller.goToPageEdit(controller.data[index]);
                },
                child: Card(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     Text("name : ${controller.data[index]['users_name'].toString()}",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colorapp.primaryColor,fontSize: 18),),
                      Text("email :${controller.data[index]['users_email'].toString()}",textAlign: TextAlign.center,style: TextStyle(color: Colorapp.secondColor,fontSize: 15),),
                   Text("phone :${controller.data[index]['users_phone'].toString()}",textAlign: TextAlign.center,style: TextStyle(color: Colorapp.secondColor,fontSize: 15),),
                    Text("acount crate:${controller.data[index]['users_create'].toString()}",textAlign: TextAlign.center,style: TextStyle(color: Colorapp.secondColor,fontSize: 15),),


                  ],
                )

                ),
              );
            } ),)),),
    );
  }
}
