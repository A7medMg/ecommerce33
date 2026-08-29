import 'package:flutter/material.dart';

import '../../../core/consstans/color/colorapp.dart';

class PriceAndCount extends StatelessWidget {
  final String price;
final void Function()? add;
  final void Function()? minus ;
  final int count;


  const PriceAndCount({super.key, required this.price, this.add, this.minus, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(
        children: [
          IconButton(onPressed: add, icon:const Icon(Icons.add)),
          Container(
              padding:const EdgeInsets.only(bottom: 3
              ),
              alignment: Alignment.topCenter,
              //height: 30,
              width: 50,
              decoration: BoxDecoration(border: Border.all(
                  color: Colors.black
              )),
              child: Text("${count}",style:const TextStyle(fontSize: 25,height: 1.1,fontFamily: "sans"),)),
          IconButton(onPressed:minus , icon:const Icon(Icons.remove))

        ],
      ),
     const Spacer(),
      Text("${price}\$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colorapp.primaryColor,height: 1.1,fontFamily: "sans"),)
    ],)
    ;
  }
}
