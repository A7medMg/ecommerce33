import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopadmin/conttrolar/homeScreenCntroller.dart';

import 'CustomBottunBomttomAppBar.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            //  shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.page.length , (index) {
                   
                    return  Expanded(
                      child: CustomButtonBottomAppBar(
                              lable: controller.iconBottomAppBarName[index],
                              onPressed: () {
                                controller.changePage(index);
                              },
                              icon: controller.iconBottomAppBar[index],
                              active: controller.currentPage == index ? true : false,
                            ),
                    );
                  })
                ],
              ),
            ));
  }
}
