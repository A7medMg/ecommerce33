import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/OnBoardingController/OnBoardingController.dart';

import '../../../core/consstans/color/colorapp.dart';
import '../../../data/datasource/static/static.dart';

class CustomSlider extends GetView<OnBoardingControllerImp> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return   PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
       controller.onPageChanged(val);
      },
        itemCount:onBoardinList.length ,itemBuilder: (context,i)=>Column(
      children: [

        Text('${onBoardinList[i].title}',style:Theme.of(context).textTheme.headline1,),
        SizedBox(height: 80,),
        Image.asset('${onBoardinList[i].image}',width: 200,height: 230,fit: BoxFit.fill,),
        SizedBox(height: 80,),
        Container(alignment: Alignment.center,width: double.infinity,child: Text('${onBoardinList[i].body}',style: Theme.of(context).textTheme.bodyText1)),
      ],
    ));
  }
}
