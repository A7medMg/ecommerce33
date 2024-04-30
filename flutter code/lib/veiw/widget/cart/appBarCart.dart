import 'package:flutter/material.dart';

class CustomAppBarCart extends StatelessWidget {
  final String title;
  final void Function()? onPressedBackArrow;
  const CustomAppBarCart({super.key, required this.title, this.onPressedBackArrow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child:Row(
        children: [
          Expanded(child: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(onPressed:onPressedBackArrow,icon:const Icon(Icons.arrow_back),),)),
          Expanded(child: Container(alignment:Alignment.center,child:  Text(title,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),))),
          Spacer(),
        ],
      ),

    )
    ;
  }
}
