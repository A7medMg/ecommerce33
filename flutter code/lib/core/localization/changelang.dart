import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/consstans/AppTheme.dart';
import 'package:shoppapp/core/services/services.dart';

class LocaleController extends GetxController{
  Locale ? language;
  ThemeData appTheme=englishTheme;
  MyServices myServices=Get.find();
  ChangLang(String langcode){
    Locale local=Locale(langcode);
    myServices.sharedPreferences.setString('lang', langcode);
    appTheme=langcode=='ar' ?arabicTheme :englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(local);


  }
  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Attention", "Please turn on the location service");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Attention", "Please give location permission to the application");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("Attention", "The application cannot be used without the location");
    }
  }
  @override
  void onInit() {
    requestPerLocation();
    String ? sharedPrefLang=myServices.sharedPreferences.getString('lang');
    if(sharedPrefLang=='ar'){
      language=const Locale('ar');
      appTheme=arabicTheme;
    }else if(sharedPrefLang=='en'){
      language=const Locale('en');
      appTheme=englishTheme;
    }else{
      language=Locale(Get.deviceLocale!.languageCode);
      appTheme=englishTheme;
    }

    // TODO: implement onInit
    super.onInit();
  }
}