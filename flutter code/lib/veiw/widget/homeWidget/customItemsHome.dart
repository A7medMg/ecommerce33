import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/HomeController.dart';

import '../../../core/consstans/color/colorapp.dart';
import '../../../core/functions/translationDatabase.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';

class CustomItemsHome extends GetView<HomeControllerImp> {
  const CustomItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(

        itemBuilder: (context, index) {
          return Items(itemsModel: ItemsModel.fromJson(controller.items[index]),);
        },
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
      ),
    );
  }
}
class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 10),
          padding:const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10),
          child: Image.network(
            "${AppLinkApi.staticImageItems}/${itemsModel.itemsImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colorapp.black.withOpacity(0.3)),
          height: 120,
          width: 200,
        ),
        Positioned(
            left: 10,
            child: Text(
              " ${translateDatabase(itemsModel.itemsNameAr,itemsModel.itemsName)}",
              style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ))
      ],
    );
  }
}

