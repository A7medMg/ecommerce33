import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/cartController.dart';

import '../../../core/consstans/color/colorapp.dart';
import '../../../core/consstans/namesRout.dart';
import 'cartButtonOrder.dart';
import 'customButtonCopun.dart';

class CustomBottomCartNavigationBar extends GetView<CartController> {
  final String price;
  final String discount;
final TextEditingController controllerCoupon;
  final String totalPrice;
  final String Shipping;

  final void Function()? apply;

  const CustomBottomCartNavigationBar({super.key, required this.price, required this.discount, required this.totalPrice, required this.controllerCoupon, this.apply, required this.Shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(builder:(controller)=>

          controller.couponName==null ?    Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    flex:2,

                    child: TextFormField(
                      controller: controllerCoupon,
                      decoration: InputDecoration(
                          hintText: "Coupon Code",
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          border: OutlineInputBorder()
                      ),
                    )),
                SizedBox(width: 10,),
                Expanded(
                    flex:1,
                    child: CustomButtonCoupon(textbutton: "Apply",onPressed: apply,))

              ],
            ),
          ) :Text(controller.couponName)),
      Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colorapp.primaryColor),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(padding:const EdgeInsets.symmetric(horizontal: 20),child: Text("price",style: TextStyle(fontSize: 20 ),)),
              Container(padding: const EdgeInsets.symmetric(horizontal: 20),child: Text("$price\$",style: TextStyle(fontSize: 20,fontFamily: 'sans' ))),


            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(padding:const EdgeInsets.symmetric(horizontal: 20),child: Text("discount",style: TextStyle(fontSize: 20 ),)),
              Container(padding:const EdgeInsets.symmetric(horizontal: 20),child: Text("$discount",style: TextStyle(fontSize: 20 ,fontFamily: 'sans'))),


            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(padding:const EdgeInsets.symmetric(horizontal: 20),child: Text("Shipping",style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color: Colorapp.primaryColor),)),
              Container(padding:const EdgeInsets.symmetric(horizontal: 20),child: Text("$Shipping\$",style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color: Colorapp.primaryColor,fontFamily: 'sans'))),


            ],),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(padding:const EdgeInsets.symmetric(horizontal: 20),child: Text("Total Price",style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color: Colorapp.primaryColor),)),
              Container(padding:const EdgeInsets.symmetric(horizontal: 20),child: Text("$totalPrice\$",style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color: Colorapp.primaryColor,fontFamily: 'sans'))),


            ],),
        ],
      ),),

          SizedBox(height: 20,),
          CustomButtonCart(textbutton: 'Place Order',onPressed: (){
            controller.goToPageCheckout();
          },)
        ],
      ),
    );
  }
}
