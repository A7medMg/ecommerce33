import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/productdetailsController.dart';

import '../../../core/consstans/color/colorapp.dart';

class SubItemsColors extends GetView<ProductDetailsControllerImp> {
  const SubItemsColors({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        ...List.generate(controller.subItems.length, (index) => Container(
          margin: EdgeInsets.only(right: 10),
          height:70 ,
          width: 90,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color:controller.subItems[index]["active"]=="1" ?Colorapp.fourthColor:Colors.white,
            border: Border.all(color: Colorapp.fav),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(controller.subItems[index]["name"],style: controller.subItems[index]["active"]=="1"?TextStyle(fontWeight: FontWeight.bold,color: Colors.white):TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
        ),)


      ],
    )
    ;
  }
}
