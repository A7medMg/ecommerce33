import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/ItemsController.dart';
import 'package:shoppapp/conttrolar/favoriteController.dart';
import 'package:shoppapp/data/model/itemsmodel.dart';

import '../../../core/consstans/color/colorapp.dart';
import '../../../core/consstans/imageassets.dart';
import '../../../core/functions/translationDatabase.dart';
import '../../../linkapi.dart';

class CustomItemsView extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  //final bool active;

  const CustomItemsView({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl: AppLinkApi.staticImageItems +
                          "/" +
                          itemsModel.itemsImage!,
                      width: 200,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    " ${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Rating 3.8",
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 22,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 15,
                                    ))
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("${itemsModel.itemsPriceDiscount}\$",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colorapp.primaryColor,
                              fontFamily: "sans")),
                      Spacer(),
                      GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemsId] ==
                                    1) {
                                  controller.setFavorite(itemsModel.itemsId, 0);
                                  controller.deleteFavorite(
                                      itemsModel.itemsId!.toString());
                                } else {
                                  controller.setFavorite(itemsModel.itemsId, 1);
                                  controller
                                      .addFavorite(itemsModel.itemsId!.toString());
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == 1
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colorapp.primaryColor,
                              )))
                    ],
                  )
                ],
              ),
            ),
            if(itemsModel.itemsDiscount !=0)
            Positioned(
                top: 4,
                left: 4,
                child: Image.asset(ImageAssets.discount,width: 60,)),
          ],
        ),
      ),
    );
  }
}
