import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/OnBoardingController/OnBoardingController.dart';

import '../../../core/consstans/color/colorapp.dart';
import '../../../data/datasource/static/static.dart';

class CustomDote extends StatelessWidget {
  const CustomDote({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) =>
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...List.generate(
                  onBoardinList.length,
                  (index) => AnimatedContainer(
                        margin: EdgeInsets.only(right: 5),
                        duration: Duration(milliseconds: 900),
                        width: index==controller.currentPage ?20:5,
                        height: 6,
                        decoration: BoxDecoration(
                            color: Colorapp.primaryColor,
                            borderRadius: BorderRadius.circular(18)),
                      ))
            ]));
  }
}
