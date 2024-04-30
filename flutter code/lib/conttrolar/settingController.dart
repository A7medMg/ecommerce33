import 'package:get/get.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/core/services/services.dart';

class SettingsController extends GetxController{
  MyServices myServices=Get.find();
  logOut(){
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.Login);
  }
}