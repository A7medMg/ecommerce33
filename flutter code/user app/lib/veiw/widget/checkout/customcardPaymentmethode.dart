import 'package:flutter/material.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Container(padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      margin:const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color:isActive == true ? Colorapp.secondColor:Colorapp.thirdColor,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Text(title,
        style: TextStyle(height: 1,color:isActive == true ? Colors.white:Colorapp.secondColor,fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Cairo'),),
    );
  }
}
