import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/address/view.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';

import '../../core/consstans/color/colorapp.dart';
import '../../data/model/addressModel.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController controller= Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(
        title:const Text("Address",),
        backgroundColor: Colorapp.primaryColor,
      ),
      floatingActionButton: FloatingActionButton(

        backgroundColor: Colorapp.primaryColor ,
        child:const Icon(Icons.add,),
        onPressed: (){
          Get.toNamed(AppRoute.addressAdd);
        },
      ),
      body:GetBuilder<AddressViewController>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget:
      Container(
        child: ListView.builder(
          itemBuilder: (context,index)=>CardAddress(addressModel: controller.data[index],onDelete: (){
            controller.deleteAddress(controller.data[index].addressId!.toString());
          },),
          itemCount: controller.data.length,

        ),
      )),)
    );
  }
}
class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({Key? key, required this.addressModel, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(addressModel.addressName!,style:const  TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            ),
            subtitle: Text(
                "${addressModel.addressCity!} ${addressModel.addressStreet}"),
            trailing: IconButton(
                onPressed: onDelete, icon: Icon(Icons.delete_outline)),
          )),
    );
  }
}
