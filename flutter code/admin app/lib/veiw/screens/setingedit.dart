import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopadmin/conttrolar/categories/add_controller.dart';
import 'package:shopadmin/conttrolar/setting.dart';
import 'package:shopadmin/core/classes/handlingDataView.dart';
import 'package:shopadmin/core/consstans/color/colorapp.dart';
import 'package:shopadmin/core/functions/ValidInput.dart';
import 'package:shopadmin/veiw/widget/Auth/CustomBottonAuth.dart';
import 'package:shopadmin/veiw/widget/onBoarding/CustomBottoun.dart';

import '../../../conttrolar/categories/edit_controller.dart';
import '../../../core/functions/uploadFile.dart';
import '../../../core/shared/deafualtFormfiled.dart';

class SettingEdit extends StatelessWidget {
  const SettingEdit({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller=Get.put(SettingControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edite Setting"),
      ),
      body: GetBuilder<SettingControllerImp>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
        padding: EdgeInsets.all( 20),
        child: Form(
          key: controller.formstatelog,
          child: ListView(
            children: [
              SizedBox(height: 35,),
              CustomTextFormGlobal(hinttext: 'Enter title name', labeltext: 'title name', iconData: Icons.category_outlined, mycontroller: controller.title, valid: (val ) {
                return ValidInput(val!, 1, 30, "");
              }, isNumber: false,),
              SizedBox(height: 15,),
              CustomTextFormGlobal(hinttext: 'Enter body name ', labeltext: 'body name ', iconData: Icons.category_outlined, mycontroller: controller.body, valid: (val ) {
                return ValidInput(val!, 1, 30, "");
              }, isNumber: false,),
              SizedBox(height: 15,),


              SizedBox(height: 15,),
              CustomBottomAuth(text: "Save",onPressed: (){
                controller.setSetting();
              },),

            ],
          ),
        ),
      )),),
    );
  }
}
