import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';

import '../../core/consstans/color/colorapp.dart';

import '../../core/localization/changelang.dart';
import '../widget/language/Custombutton.dart';

class Language_Screen extends GetView<LocaleController> {
  const Language_Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding:const EdgeInsets.symmetric(horizontal: 80),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1'.tr,style: Theme.of(context).textTheme.headline1,),
            const SizedBox(height: 20,),
            CustomButton(textName: 'Ar', onPressed: () {
              controller.ChangLang('ar');
              Get.toNamed(AppRoute.onBoarding);

            },),
            const SizedBox(height: 25,),
            CustomButton(textName: 'En', onPressed: () {  
              controller.ChangLang('en');
              Get.toNamed(AppRoute.onBoarding);
            },)
          ],
        ),
      ),
    );
  }
}
