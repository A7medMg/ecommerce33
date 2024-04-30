import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/cartController.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';

import '../../core/consstans/imageassets.dart';
import '../widget/cart/CustomCartListItems.dart';
import '../widget/cart/appBarCart.dart';
import '../widget/cart/cartButtonOrder.dart';
import '../widget/cart/customBottomCartNavgationBar.dart';
import '../widget/cart/topCartItemshave.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController =Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child:GetBuilder<CartController>(builder: (controller)=>CustomBottomCartNavigationBar(price: '${cartController.priceOrders}', shipping: '5000', totalPrice: '5000',) ,),
      ),
      body:GetBuilder<CartController>(builder:(controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget:  ListView(children: [
        CustomAppBarCart(onPressedBackArrow: (){
          Get.back();
        },title: "My Cart",),

        SizedBox(height: 20,),
        CustomTopIdentifierCart(count: "${cartController.totalcountitems}",),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              
              ...List.generate(cartController.data.length, (index) => CustomCartItemsList(
                nameImage: '${cartController.data[index].itemsImage}',
                itemsName: '${cartController.data[index].itemsName}',
                itemsCount: '${cartController.data[index].countitems}',
                itemsPrice: '${cartController.data[index].itemsPrice! - cartController.data[index].itemsPrice! * cartController.data[index].itemsDiscount! /100}',
                onPressedAdd: ()async{
                 await cartController.addToCart(cartController.data[index].itemsId!.toString());
                  cartController.refrespage();
                },
                onPressedMinus: ()async{
                  await cartController.deleteFromCart(cartController.data[index].itemsId!.toString());
                  cartController.refrespage();

                },))

            ],
          ),
        )

      ],)),),
    );
  }
}
