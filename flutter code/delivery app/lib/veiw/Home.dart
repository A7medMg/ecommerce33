import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopadmin/conttrolar/HomeController.dart';
import 'package:shopadmin/core/classes/handlingDataView.dart';
import 'package:shopadmin/linkapi.dart';
import 'package:shopadmin/veiw/widget/homeWidget/customCardDiscount.dart';
import 'package:shopadmin/veiw/widget/homeWidget/customItemsHome.dart';
import 'package:shopadmin/veiw/widget/homeWidget/customappBar.dart';
import 'package:shopadmin/veiw/widget/homeWidget/listcategorise.dart';

import '../core/consstans/color/colorapp.dart';
import '../core/consstans/namesRout.dart';
import '../data/model/itemsmodel.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    List image=[
      'assets/images/dog.jpg',
    'assets/images/cat.jpg',

    'assets/images/bird.jpg',


    ];
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("orders"),
      ),
   
      body: Container(),
     
    );
  }
}

  