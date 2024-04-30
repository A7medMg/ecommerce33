import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/ItemsController.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/data/model/itemsmodel.dart';
import 'package:shoppapp/linkapi.dart';

import '../../conttrolar/favoriteController.dart';
import '../Home.dart';
import '../widget/homeWidget/customappBar.dart';
import '../widget/items/customListCategoriesitems.dart';
import '../widget/items/itemslistveiw.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp  controller= Get.put(ItemsControllerImp());
    FavoriteController controllerFav=Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(children: [
          CustomHomeAppBar(

            mycontroller: controller.search!,
            onChanged: (val){
              controller.checkSearch(val);
            },
            title: "Find Product",onPressedNotification: (){},onPressedSearch: (){
            controller.onSearchItems();
          },onPressedFavorite: (){
            Get.toNamed(AppRoute.myFavorite);
          },),

          const SizedBox(
            height: 20,
          ),
          const CustomListCategoriesItems(),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: .66),
                      itemBuilder: (BuildContext context, index) {
                        controllerFav.isFavorite[controller.data[index]['items_id']]=controller.data[index]['favorite'];
                        return CustomItemsView(


                          itemsModel:
                              ItemsModel.fromJson(controller.data[index]),
                        );
                      }):ListItemsSearch(listDataModel: controller.listData,)
              )
          )
        ]),
      ),
    );
  }
}
