import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/productdetailsController.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/core/functions/translationDatabase.dart';
import 'package:shoppapp/linkapi.dart';

import '../widget/items/subItemsColor.dart';
import '../widget/items/topImageProductdetails.dart';
import '../widget/productdetails/price&count.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          height: 50,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colorapp.fav,
            onPressed: () {

              Get.toNamed(AppRoute.cartView);
            },
            child: const Text(
              "Go To Cart",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colorapp.fourthColor),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                child: ListView(
                  children: [
                    TopImageProductDetails(),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${translateDatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: Colorapp.fourthColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PriceAndCount(
                            add: () {

                              controller.add();
                            },
                            minus: () {

                              controller.minus();
                            },
                            price: controller.itemsModel.itemsPriceDiscount.toString(),
                            count: controller.countitems,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                              "${translateDatabase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)} ${translateDatabase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)} ",
                              style: TextStyle(fontFamily: "sans",fontSize: 18),),
                          const SizedBox(
                            height: 20,
                          ),
                          /*  Text(
                  "Color",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colorapp.fourthColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                 SubItemsColors(),*/
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
