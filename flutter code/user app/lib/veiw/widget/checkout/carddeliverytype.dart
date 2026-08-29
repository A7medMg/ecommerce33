import 'package:flutter/material.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';
import 'package:shoppapp/core/consstans/imageassets.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final bool isActive;
  final String image;
  final String title;
  const CardDeliveryTypeCheckout({super.key, required this.isActive, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color:isActive==true ? Colorapp.secondColor:null,
        border: Border.all(color: Colorapp.secondColor,),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image,width: 60,color: isActive ==true ?Colors.white:null,),
           Text(title,style: TextStyle(fontWeight: FontWeight.bold,color:isActive == true?Colors.white:Colorapp.secondColor),)
        ],
      ),
    );
  }
}
