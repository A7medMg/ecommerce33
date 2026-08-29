import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopadmin/veiw/Home.dart';

import '../veiw/screens/orders/accepted.dart';
import '../veiw/screens/orders/pending.dart';



abstract class HomeScreenController extends GetxController{
  changePage(int currentPage);
}
class HomeScreenControllerImp extends HomeScreenController{
  int currentPage=0;
  List<Widget> page=[
    OrdersPending(),
   OrdersAccepted(),
   Container(child: Center(child: Text("setting")),)

  ];
  List<String> iconBottomAppBarName=[
    "Pending",
   
    "Accepted",
        "setting",


  ];
  List<IconData> iconBottomAppBar=[
    Icons.home,
        Icons.archive_outlined,



    Icons.settings,


  ];


  @override
  changePage(int index) {
    currentPage=index;
    update();

  }

}