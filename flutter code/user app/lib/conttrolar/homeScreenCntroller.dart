import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/veiw/Home.dart';

import '../veiw/screens/MyFavorite.dart';
import '../veiw/screens/OffersScreen.dart';
import '../veiw/screens/Setting.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int currentPage);
}
class HomeScreenControllerImp extends HomeScreenController{
  int currentPage=0;
  List<Widget> page=[
    Home_Page(),

    MyFavorite(),
    OffersItemsScreen(),
    const SettingScreen(),

  ];
  List<String> iconBottomAppBarName=[
    "Home",
    "Favourite",
    "Offers",
    "Setting",

  ];
  List<IconData> iconBottomAppBar=[
    Icons.home,
    Icons.favorite_border,
    Icons.local_fire_department_outlined,

    Icons.settings,


  ];


  @override
  changePage(int index) {
    currentPage=index;
    update();

  }

}