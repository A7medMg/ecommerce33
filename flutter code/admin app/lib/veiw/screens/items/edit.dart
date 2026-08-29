import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopadmin/conttrolar/categories/add_controller.dart';
import 'package:shopadmin/conttrolar/items/edit_controller.dart';
import 'package:shopadmin/core/classes/handlingDataView.dart';
import 'package:shopadmin/core/consstans/color/colorapp.dart';
import 'package:shopadmin/core/functions/ValidInput.dart';
import 'package:shopadmin/veiw/widget/Auth/CustomBottonAuth.dart';
import 'package:shopadmin/veiw/widget/onBoarding/CustomBottoun.dart';

import '../../../conttrolar/items/add_controller.dart';
import '../../../core/functions/uploadFile.dart';
import '../../../core/shared/CustomDropDownSearch.dart';
import '../../../core/shared/deafualtFormfiled.dart';

class EditeItemsAdmin extends StatelessWidget {
  const EditeItemsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsAdminEditController controller=Get.put(ItemsAdminEditController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit items"),
      ),
      body: GetBuilder<ItemsAdminEditController>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
        padding: EdgeInsets.all( 20),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              SizedBox(height: 35,),
              CustomTextFormGlobal(hinttext: 'Enter items name', labeltext: 'items name', iconData: Icons.category_outlined, mycontroller: controller.name, valid: (val ) {
                return ValidInput(val!, 1, 30, "");
              }, isNumber: false,),
              SizedBox(height: 15,),
              CustomTextFormGlobal(hinttext: 'Enter items name(arabic)', labeltext: 'items name(arabic)', iconData: Icons.category_outlined, mycontroller: controller.namear, valid: (val ) {
                return ValidInput(val!, 1, 30, "");
              }, isNumber: false,),
              SizedBox(height: 15,),
              CustomTextFormGlobal(hinttext: 'Enter items desc', labeltext: 'items desc', iconData: Icons.category_outlined, mycontroller: controller.desc, valid: (val ) {
                return ValidInput(val!, 1, 3000, "");
              }, isNumber: false,),
              SizedBox(height: 15,),
              CustomTextFormGlobal(hinttext: 'Enter items desc(arabic)', labeltext: 'items desc(arabic)', iconData: Icons.category_outlined, mycontroller: controller.descAr, valid: (val ) {
                return ValidInput(val!, 1, 3000, "");
              }, isNumber: false,),
              SizedBox(height: 15,),
              CustomTextFormGlobal(hinttext: 'Enter items count', labeltext: 'items count', iconData: Icons.category_outlined, mycontroller: controller.count, valid: (val ) {
                return ValidInput(val!, 1, 30, "");
              }, isNumber: true,),
              SizedBox(height: 15,),
              CustomTextFormGlobal(hinttext: 'Enter price ', labeltext: 'items price', iconData: Icons.category_outlined, mycontroller: controller.price, valid: (val ) {
                return ValidInput(val!, 1, 30, "");
              }, isNumber: true,),
              SizedBox(height: 15,),
              CustomTextFormGlobal(hinttext: 'Enter items discount', labeltext: 'items discount', iconData: Icons.category_outlined, mycontroller: controller.discount, valid: (val ) {
                return ValidInput(val!, 1, 30, "");
              }, isNumber: true,),
              SizedBox(height: 15,),
              CustomDropDownSearch(listData: controller.dropDownList, dropDownSelectedName: controller.catName, dropDownSelectedId: controller.catid,title: "Choose categories",),
              SizedBox(height: 15,),
              RadioListTile(
                  title:Text("hide") ,
                  value: "0", groupValue:  controller.active, onChanged: (val){
                    controller.changStatusActive(val);
              }),
              RadioListTile(
                  title:Text("active") ,
                  value: "1", groupValue: controller.active, onChanged: (val){
                controller.changStatusActive(val);
              }),

              SizedBox(height: 15,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colorapp.thirdColor,

                  ),
                  child: MaterialButton(onPressed: (){
                    controller.chooseImage();
                  },child: Text("Chose items image"),)),

              if(controller.file!=null)
                Image.file(controller.file!,height: 40,width: 40,),
              SizedBox(height: 15,),
              CustomBottomAuth(text: "Save",onPressed: (){
                controller.editData();
              },),

            ],
          ),
        ),
      )),),
    );
  }
}
