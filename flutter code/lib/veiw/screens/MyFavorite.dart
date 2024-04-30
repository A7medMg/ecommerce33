import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';

import '../../conttrolar/myFavoriteView.dart';
import '../../core/consstans/namesRout.dart';
import '../widget/favorite/favoriteView.dart';
import '../widget/homeWidget/customappBar.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteViewController());
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GetBuilder<FavoriteViewController>(
            builder: (controller) => ListView(
              children: [
              /*  CustomHomeAppBar(

                  title: "Find Product",
                  onPressedNotification: () {},
                  onPressedSearch: () {},
                  onPressedFavorite: () {
                    Get.toNamed(AppRoute.myFavorite);
                  },
                ),*/
                SizedBox(height: 25,),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(

                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,childAspectRatio: 0.66),
                      itemBuilder: (context,index){
                        return CustomFavoriteView(itemsModel: controller.data[index],);
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
