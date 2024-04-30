import 'package:flutter/material.dart';

import '../../../core/consstans/color/colorapp.dart';
import 'cartButtonOrder.dart';

class CustomBottomCartNavigationBar extends StatelessWidget {
  final String price;
  final String shipping;

  final String totalPrice;

  const CustomBottomCartNavigationBar({super.key, required this.price, required this.shipping, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
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
              Container(padding:const EdgeInsets.symmetric(horizontal: 20),child: Text("Shipping",style: TextStyle(fontSize: 20 ),)),
              Container(padding:const EdgeInsets.symmetric(horizontal: 20),child: Text("$shipping\$",style: TextStyle(fontSize: 20 ,fontFamily: 'sans'))),


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
          CustomButtonCart(textbutton: 'Place Order',onPressed: (){},)
        ],
      ),
    );
  }
}
