import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';

import '../../conttrolar/myFavoriteView.dart';
import '../../core/consstans/namesRout.dart';
import '../widget/favorite/customfavourite.dart';
import '../widget/favorite/favoriteView.dart';
import '../widget/homeWidget/customappBar.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteViewController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<FavoriteViewController>(
            builder: ((controller) =>
                HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(children: [

                  const SizedBox(height: 20),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return CustomListFavoriteItems(
                              itemsModel: controller.data[index]);
                        },
                      ))
                ]))
            )),
      ),
    );
  }
}
