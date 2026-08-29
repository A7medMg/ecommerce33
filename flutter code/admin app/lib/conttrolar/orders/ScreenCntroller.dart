import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopadmin/veiw/OrdersScreen.dart';

import '../../veiw/screens/Homescreen.dart';
import '../../veiw/screens/orders/accepted.dart';
import '../../veiw/screens/orders/pending.dart';



abstract class OrdersScreenController extends GetxController{
  changePage(int currentPage);
}
class OrdersScreenControllerImp extends OrdersScreenController{
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