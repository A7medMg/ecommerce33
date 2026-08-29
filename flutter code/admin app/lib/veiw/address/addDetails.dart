import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopadmin/conttrolar/address/AddressAddDetails.dart';
import 'package:shopadmin/core/classes/handlingDataView.dart';
import 'package:shopadmin/veiw/widget/Auth/CustomBottonAuth.dart';
import 'package:shopadmin/veiw/widget/Auth/CustomTextFormFiled.dart';

import '../../core/consstans/color/colorapp.dart';
import '../../core/shared/customdefualt.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressAddDetailsController controller =
        Get.put(AddressAddDetailsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " Address details",
        ),

      ),
      body:GetBuilder<AddressAddDetailsController>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest,
          widget:  Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFiled(
                    hintText: "City",
                    label: "City",
                    suffixIcon: Icons.location_city_outlined,
                    myController: controller.city!,
                    validator: (val) {}),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFiled(
                    hintText: "Street",
                    label: "Street",
                    suffixIcon: Icons.streetview,
                    myController: controller.street!,
                    validator: (val) {}),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFiled(
                    hintText: "name",
                    label: "name",
                    suffixIcon: Icons.drive_file_rename_outline_outlined,
                    myController: controller.name!,
                    validator: (val) {}),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(text: "Add",onPressed: (){
                  controller.addAddress();
                },)
              ],
            ),
          )),),
    );
  }
}
