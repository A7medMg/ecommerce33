import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/core/services/services.dart';

class SettingsController extends GetxController{
  MyServices myServices=Get.find();
  logOut(){
    String usersId=myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${usersId}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.Login);
  }
}