import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopadmin/conttrolar/orders/ScreenCntroller.dart';
import 'package:shopadmin/core/consstans/color/colorapp.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';

import '../widget/HomeScreen/CustomBottunBomttomAppBar.dart';
import '../widget/HomeScreen/customBottomAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreenControllerImp());
    return GetBuilder<OrdersScreenControllerImp>(
        builder: (controller) => Scaffold(




          bottomNavigationBar: CustomBottomAppBar(),
          body: WillPopScope(
            child: controller.page.elementAt(controller.currentPage),
            onWillPop: () {
              Get.back();

              return Future.value(false);
            },
          ),
        ));
  }
}
