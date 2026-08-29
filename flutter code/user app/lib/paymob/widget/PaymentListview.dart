import 'package:flutter/material.dart';

import 'methodItempayment.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    List url=[
      "assets/images/card.svg",
      "assets/images/paypal.svg"
    ];
    return SizedBox(
      height: 62,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,i)=>GestureDetector(
              onTap: (){
                activeIndex=i;
                setState(() {

                });
              },
              child: PaymentItemBuilder(image: url[i],isActive: activeIndex==i,)), separatorBuilder: (context,i)=>const SizedBox(width: 20,), itemCount: url.length),
    );
  }
}
