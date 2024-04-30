import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/HomeController.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';
import 'package:shoppapp/linkapi.dart';
import 'package:shoppapp/veiw/widget/homeWidget/customCardDiscount.dart';
import 'package:shoppapp/veiw/widget/homeWidget/customItemsHome.dart';
import 'package:shoppapp/veiw/widget/homeWidget/customappBar.dart';
import 'package:shoppapp/veiw/widget/homeWidget/listcategorise.dart';

import '../core/consstans/color/colorapp.dart';
import '../core/consstans/namesRout.dart';
import '../data/model/itemsmodel.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) =>  Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
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
          HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:  !controller.isSearch ?     Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              CustomCardDiscount(title:  "A Summer Surprise",body: "cashback 20%",),
              CustomListCategories(),
              SizedBox(
                height: 15,
              ),
              Text(
                "Product For You",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colorapp.secondColor),
              ),
              SizedBox(
                height: 15,
              ),
              CustomItemsHome(),
              Text(
                "Product For You",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colorapp.secondColor),
              ),
              SizedBox(
                height: 15,
              ),
              CustomItemsHome(),
            ],):ListItemsSearch(listDataModel: controller.listData,)
          )



              ],

          ),
        ),
      ),
    );
  }
}
class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: listDataModel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              controller.goToProductDetails(listDataModel[index]);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Card(child: Container
                (
                padding: EdgeInsets.all(15),

                child: Row(
                  children: [
                    Expanded(child: CachedNetworkImage(imageUrl: "${ AppLinkApi.staticImageItems}/${ listDataModel[index].itemsImage}",)),
                    Expanded(flex:4,child: ListTile(
                      title: Text("${listDataModel[index].itemsName}"),
                      subtitle:Text("${listDataModel[index].categoriesName}") ,

                    ))
                  ],
                ),
              ),),
            ),
          );

    });
  }
}

