import 'package:flutter/material.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';



class TotalPrice extends StatelessWidget {
  final String title;
  final String value;

  const TotalPrice({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Colorapp.style24,),
        const Spacer(),
        Text(value, style: Colorapp.style24,),
      ],
    );
  }
}