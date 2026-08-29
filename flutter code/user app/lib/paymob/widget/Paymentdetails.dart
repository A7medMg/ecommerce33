import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';

import 'PaymentDetailViewBody.dart';



class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0.0,

        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading:Center(child: SvgPicture.asset("assets/images/Arrow 1.svg",)),
        title:const Text("Payment Details",style: Colorapp.style25,),
      ),
      body:const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15),
        child:  PaymentDetailViewBody(),
      ),
    );
  }
}
