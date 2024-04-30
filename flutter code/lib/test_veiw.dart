

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/test_conttroller.dart';


import 'core/classes/handlingDataView.dart';
import 'core/consstans/color/colorapp.dart';

class Test_View extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
     // backgroundColor: Colorapp.primaryColor,
      appBar: AppBar(
        backgroundColor: Colorapp.primaryColor,
        title: Text("Test view"),
      ),
      body:GetBuilder<TestController>(builder: (controller){
       return  HandlingDataView(statusRequest: controller.statusRequest,widget:ListView.builder(itemCount: controller.data.length,itemBuilder: (context,index){
         return Text("${controller.data}");
       }) ,);
      },),
    );
  }
}
