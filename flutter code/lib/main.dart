import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shoppapp/testx.dart';
import 'package:shoppapp/veiw/screens/OnBoardin_Screen.dart';
import 'package:shoppapp/veiw/screens/language.dart';

import 'Binding/intialBinding.dart';
import 'core/consstans/color/colorapp.dart';
import 'core/localization/changelang.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialMyServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller=Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      locale: controller.language,
      translations: Mytranslation(),
      initialBinding: InitialBindings(),


      theme:controller.appTheme,
     // routes: routes,
      getPages: routes,
    );
  }
}
