import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../conttrolar/HomeController.dart';
import '../../../core/consstans/color/colorapp.dart';

class CustomCardDiscount extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardDiscount({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: Colorapp.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child:  ListTile(
              title: Text(title
               ,
                style:const TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(body
                ,
                style:const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: -10,
            left:controller.lang=="ar"? -30:null,
            right:controller.lang=="en"? -30:null,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colorapp.secondColor,
                borderRadius: BorderRadius.circular(90),
              ),
            ),
          )
        ],
      ),
    );
  }
}
