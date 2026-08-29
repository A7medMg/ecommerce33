import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopadmin/conttrolar/HomeController.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';
import 'package:shopadmin/veiw/widget/homeWidget/cardAdminPanel.dart';

import '../conttrolar/usersView.dart';
import '../core/consstans/imageassets.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    UsersAdminViewController c= Get.put(UsersAdminViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        children: [
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 150),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CardAdmin(url: ImageAssets.avatar ,title: "Users ${c.data.length.toString()}",

                onTap: (){
                Get.toNamed(AppRoute.UsersViewEdite);
              },),
              CardAdmin(url: ImageAssets.product ,title: "Categories",onTap: (){
                Get.toNamed(AppRoute.categoriesView);
              },),
              CardAdmin(url: ImageAssets.items ,title: "Items",onTap: (){
                Get.toNamed(AppRoute.itemsView);
              },),

              CardAdmin(url: ImageAssets.notif ,title: "notification",onTap: (){
                Get.toNamed(AppRoute.setting);
              },),
              CardAdmin(url: ImageAssets.orders ,title: "orders",onTap: (){
                Get.toNamed(AppRoute.AdminHomeScreen);
              },),







            ],
          )
        ],
      ),
    );
  }
}
