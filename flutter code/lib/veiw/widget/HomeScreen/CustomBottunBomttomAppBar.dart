import 'package:flutter/material.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';

class CustomButtonBottomAppBar extends StatelessWidget {
  final void Function() onPressed;
  final String lable;
  final IconData icon;
  bool active = false;

  CustomButtonBottomAppBar({
    super.key,
    required this.active,
    required this.onPressed,
    required this.lable,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? Colorapp.primaryColor : Colors.grey[800],
          ),
          Text(
            lable,
            style: TextStyle(
                color: active == true ? Colorapp.primaryColor : Colors.grey[800]),
          )
        ],
      ),
    );
  }
}
