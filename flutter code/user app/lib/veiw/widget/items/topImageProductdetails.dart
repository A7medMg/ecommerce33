import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/productdetailsController.dart';

import '../../../core/consstans/color/colorapp.dart';
import '../../../linkapi.dart';

class TopImageProductDetails extends GetView<ProductDetailsControllerImp> {
  const TopImageProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colorapp.fav,
          ),
        ),
        Positioned(
            left: Get.width / 8,
            right: Get.width / 8,
            top: 30,
            child: Hero(
                tag: "${controller.itemsModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: AppLinkApi.staticImageItems +
                      "/" +
                      controller.itemsModel.itemsImage!,
                  height: 220,
                  fit: BoxFit.fill,
                )))
      ],
    );
  }
}
