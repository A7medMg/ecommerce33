import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/veiw/Home.dart';

import '../veiw/screens/MyFavorite.dart';
import '../veiw/screens/Setting.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int currentPage);
}
class HomeScreenControllerImp extends HomeScreenController{
  int currentPage=0;
  List<Widget> page=[
    Home_Page(),

    MyFavorite(),

    const SettingScreen(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("profile Screen")),
      ],
    ),

  ];
  List<String> iconBottomAppBarName=[
    "Home",
    "Favourite",
    "Setting",
    "Profile"
  ];
  List<IconData> iconBottomAppBar=[
    Icons.home,
    Icons.favorite_border,
    Icons.settings,
    Icons.person,


  ];


  @override
  changePage(int index) {
    currentPage=index;
    update();

  }

}