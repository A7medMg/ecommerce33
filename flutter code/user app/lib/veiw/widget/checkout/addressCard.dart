import 'package:flutter/material.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';

class CardAddressCheckout extends StatelessWidget {
  final bool isActive;
  final String title;
  final String body;

  const CardAddressCheckout({super.key, required this.isActive, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return   Card(
      color:isActive ? Colorapp.secondColor:null,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15) ),
      child: ListTile(
        title: Padding(
          padding:const  EdgeInsets.symmetric(vertical: 10),
          child: Text(title,style: TextStyle(fontFamily: 'sans',fontWeight: FontWeight.bold,color:isActive ?  Colors.white:null),),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom:10 ),
          child: Text(body,style: TextStyle(fontFamily: 'sans',fontWeight: FontWeight.bold,color:isActive ?  Colors.white:null),),
        ),
      ),);
  }
}
