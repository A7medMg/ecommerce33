import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/homeScreenCntroller.dart';

import 'CustomBottunBomttomAppBar.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.page.length + 1, (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : CustomButtonBottomAppBar(
                            lable: controller.iconBottomAppBarName[i],
                            onPressed: () {
                              controller.changePage(i);
                            },
                            icon: controller.iconBottomAppBar[i],
                            active: controller.currentPage == i ? true : false,
                          );
                  })
                ],
              ),
            ));
  }
}
