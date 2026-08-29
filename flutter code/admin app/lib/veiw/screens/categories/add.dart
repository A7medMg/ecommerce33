import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopadmin/conttrolar/categories/add_controller.dart';
import 'package:shopadmin/core/classes/handlingDataView.dart';
import 'package:shopadmin/core/consstans/color/colorapp.dart';
import 'package:shopadmin/core/functions/ValidInput.dart';
import 'package:shopadmin/veiw/widget/Auth/CustomBottonAuth.dart';
import 'package:shopadmin/veiw/widget/onBoarding/CustomBottoun.dart';

import '../../../core/functions/uploadFile.dart';
import '../../../core/shared/deafualtFormfiled.dart';

class AddCategoriesAdmin extends StatelessWidget {
  const AddCategoriesAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesAdminAddController controller=Get.put(CategoriesAdminAddController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Categories"),
      ),
      body: GetBuilder<CategoriesAdminAddController>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
        padding: EdgeInsets.all( 20),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              SizedBox(height: 35,),
              CustomTextFormGlobal(hinttext: 'Enter categories name', labeltext: 'categories name', iconData: Icons.category_outlined, mycontroller: controller.name, valid: (val ) {
                return ValidInput(val!, 1, 30, "");
              }, isNumber: false,),
              SizedBox(height: 15,),
              CustomTextFormGlobal(hinttext: 'Enter categories name Ar', labeltext: 'categories name ar', iconData: Icons.category_outlined, mycontroller: controller.namear, valid: (val ) {
                return ValidInput(val!, 1, 30, "");
              }, isNumber: false,),
              SizedBox(height: 15,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colorapp.thirdColor,

                  ),
                  child: MaterialButton(onPressed: (){
                   controller.chooseImage();
                  },child: Text("Chose category image"),)),
              if(controller.file!=null)
                SvgPicture.file(controller.file!,height: 40,),
              SizedBox(height: 15,),
              CustomBottomAuth(text: "Add",onPressed: (){
                controller.addData();
              },),

            ],
          ),
        ),
      )),),
    );
  }
}
