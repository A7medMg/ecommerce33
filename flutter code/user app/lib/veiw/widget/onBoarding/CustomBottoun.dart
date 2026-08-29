import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/OnBoardingController/OnBoardingController.dart';

import '../../../core/consstans/color/colorapp.dart';

class CustomButton extends GetView<OnBoardingControllerImp> {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    return  Container(height: 60,width: 290,decoration: BoxDecoration(

        color: Colorapp.primaryColor,
        borderRadius: BorderRadius.circular(37)
    ),child: MaterialButton(onPressed: (){
      controller.next();
    },child: Text("Continue",style: TextStyle(fontWeight: FontWeight.bold),)));
  }
}
