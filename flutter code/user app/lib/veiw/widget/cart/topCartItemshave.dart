import 'package:flutter/material.dart';

import '../../../core/consstans/color/colorapp.dart';

class CustomTopIdentifierCart extends StatelessWidget {
  final String count;
  const CustomTopIdentifierCart({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding:const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      //height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colorapp.thirdColor,
      ),
      child: Text("You have $count items in your cart",style:const TextStyle(fontSize: 18,fontFamily: 'sans'),),

    );
  }
}
