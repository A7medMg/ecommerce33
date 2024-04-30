import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppapp/conttrolar/homeScreenCntroller.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';

import '../widget/HomeScreen/CustomBottunBomttomAppBar.dart';
import '../widget/HomeScreen/customBottomAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colorapp.primaryColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cartView);
                },
                child:const Icon(
                  Icons.shopping_basket,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomBottomAppBar(),
              body: controller.page.elementAt(controller.currentPage),
            ));
  }
}
