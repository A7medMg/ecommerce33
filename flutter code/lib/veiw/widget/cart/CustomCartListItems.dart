import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppapp/linkapi.dart';

import '../../../core/consstans/color/colorapp.dart';
import '../../../core/consstans/imageassets.dart';

class CustomCartItemsList extends StatelessWidget {
  final String itemsName;
  final String itemsPrice;
  final String itemsCount;
  final String nameImage;

  final void Function()? onPressedAdd;
  final void Function()? onPressedMinus;



  const CustomCartItemsList({super.key, required this.itemsName, required this.itemsPrice, required this.itemsCount, this.onPressedAdd, this.onPressedMinus, required this.nameImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                  child:CachedNetworkImage(

                    height: 80,
                     imageUrl: "${AppLinkApi.staticImageItems}/$nameImage",
                  )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    itemsName,
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "${itemsPrice}\$",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colorapp.primaryColor,
                        fontFamily: 'sans'),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                Container(
                    height: 20,
                    child: IconButton(onPressed:onPressedAdd, icon:const  Icon(Icons.add))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    itemsCount,
                    style:const TextStyle(fontFamily: 'sans'),
                  ),
                ),
                Container(
                    height: 20,
                    child:
                        IconButton(onPressed: onPressedMinus, icon:const Icon(Icons.remove))),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
