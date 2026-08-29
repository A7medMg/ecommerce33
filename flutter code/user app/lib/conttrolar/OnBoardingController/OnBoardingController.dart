import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/core/services/services.dart';

import '../../data/datasource/static/static.dart';
import '../../veiw/screens/Auth/Login_Screen.dart';

abstract  class OnBoardingController extends GetxController{
  next();
  onPageChanged(int index);
}
class OnBoardingControllerImp extends OnBoardingController{
  int currentPage=0;
  late PageController pageController;
  MyServices myServices=Get.find();
  @override
  next() {
    currentPage++;
    if(currentPage>onBoardinList.length -1){
      myServices.sharedPreferences.setString('step', '1');
     Get.offAllNamed(AppRoute.Login);
    }else {
      pageController.animateToPage(
          currentPage, duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOutSine);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage=index;
    update();
  }
  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }

}