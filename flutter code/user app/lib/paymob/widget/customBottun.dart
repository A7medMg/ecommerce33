
import 'package:flutter/widgets.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';



class CustomButton55 extends StatelessWidget {
  const CustomButton55({
    super.key,
    this.onTap,
    required this.text,
  });

  final void Function()? onTap;

  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Colorapp.style22,
          ),
        ),
      ),
    );
  }
}