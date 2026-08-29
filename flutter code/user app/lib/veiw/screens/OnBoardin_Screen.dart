import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/OnBoardingController/OnBoardingController.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';
import 'package:shoppapp/veiw/widget/onBoarding/CustomSlider.dart';

import '../../data/datasource/static/static.dart';
import '../widget/onBoarding/CustomBottoun.dart';
import '../widget/onBoarding/CustomDote.dart';

class OnBoardin_Screen extends StatelessWidget {
  const OnBoardin_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: CustomSlider(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDote(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
