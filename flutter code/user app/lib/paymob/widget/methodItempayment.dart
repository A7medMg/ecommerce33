import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentItemBuilder extends StatelessWidget {
  const PaymentItemBuilder({super.key,  this.isActive=false, required this.image});
final bool isActive;
final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side:  BorderSide(
            width: 1.50,
            color:isActive ?const  Color(0xFF34A853):Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows:  [
          BoxShadow(
            color:isActive ?const  Color(0xFF34A853): Colors.white,
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),

        ],
      ),
      duration: Duration(milliseconds: 200),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
        ),
        child: Center(child: SvgPicture.asset(image,height: 42   ,fit: BoxFit.scaleDown,)),
      ),
    );
  }
}
