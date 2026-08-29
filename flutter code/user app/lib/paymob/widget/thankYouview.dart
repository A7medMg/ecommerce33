import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';



import '../../core/consstans/namesRout.dart';
import 'ThankYou_Body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0.0,

        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading:InkWell(
            onTap: (){
              Get.offAllNamed(AppRoute.Home_Page);


            },
            child: Center(child: SvgPicture.asset("assets/images/Arrow 1.svg",))),

      ),

      body: ThankYouBody(),

    );
  }
}
