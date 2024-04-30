import 'package:flutter/material.dart';

import '../../../core/consstans/color/colorapp.dart';

class CustomButton extends StatelessWidget {
  final String textName;
  final void Function()? onPressed ;
  const CustomButton({super.key, required this.textName,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 80),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          MaterialButton(
            onPressed: onPressed,
            color: Colorapp.primaryColor,
            textColor: Colors.white,
            child: Text(
              textName,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
