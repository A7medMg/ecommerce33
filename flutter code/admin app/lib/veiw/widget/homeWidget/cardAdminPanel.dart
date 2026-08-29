import 'package:flutter/material.dart';

class CardAdmin extends StatelessWidget {
  final String title;
  final String url;
  final void Function()? onTap;
  const CardAdmin({super.key, required this.title, required this.url,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Image.asset(
              url,
              height: 100,
            ),
            SizedBox(
              height: 17,
            ),
            Text(title),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
