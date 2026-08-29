import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/favoriteController.dart';
import 'package:shoppapp/conttrolar/offersController.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';

import '../../core/consstans/namesRout.dart';
import '../Home.dart';
import '../widget/Offers/customOffersItems.dart';
import '../widget/homeWidget/customappBar.dart';
import '../widget/items/itemslistveiw.dart';

class OffersItemsScreen extends StatelessWidget {
  const OffersItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OffersItemsController controller =Get.put(OffersItemsController());
    FavoriteController favoriteController=Get.put(FavoriteController());
    return GetBuilder<OffersItemsController>(builder:(controller)=>Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ListView(children: [
        CustomHomeAppBar(

          mycontroller: controller.search!,
          onChanged: (val){
            controller.checkSearch(val);
          },
          title: "Find Product",onPressedNotification: (){
          Get.toNamed(AppRoute.NotificationView);
        },onPressedSearch: (){
          controller.onSearchItems();
        },onPressedFavorite: (){
          Get.toNamed(AppRoute.myFavorite);
        },),
        const SizedBox(height: 20,),

        !controller.isSearch ? HandlingDataView(statusRequest: controller.statusRequest,widget:

          ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.data.length,
          itemBuilder: (context,index)=>CustomOffersView(itemsModel: controller.data[index],),



        ),):ListItemsSearch(listDataModel: controller.listData,)
      ],),
    ));
  }
}
