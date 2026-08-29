import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppapp/paymob/widget/thankYouview.dart';


import '../../core/consstans/namesRout.dart';
import 'PaymentListview.dart';
import 'customBottun.dart';
import 'customCreditCard.dart';
import 'methodItempayment.dart';

class PaymentDetailViewBody extends StatefulWidget {
  const PaymentDetailViewBody({super.key});

  @override
  State<PaymentDetailViewBody> createState() => _PaymentDetailViewBodyState();
}

class _PaymentDetailViewBodyState extends State<PaymentDetailViewBody> {
  final GlobalKey<FormState>formKey55=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;


  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(

        slivers: [
         const SliverToBoxAdapter(child: PaymentMethod()),
          SliverToBoxAdapter(child: CustomCreditCard(formKey: formKey55,autovalidateMode: autovalidateMode,)),
           SliverFillRemaining(hasScrollBody: false,child: Align(child: CustomButton55(text: "Pay",onTap: (){
           if(formKey55.currentState!.validate()){
             formKey55.currentState!.save();
             Get.offAllNamed(AppRoute.Home_Page);


           }else{
            // Get.offAllNamed(AppRoute.Home_Page);
             setState(() {

             });
           }
         },)),)

        ],

    );
  }
}


