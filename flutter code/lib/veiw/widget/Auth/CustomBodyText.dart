import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/localization/changelang.dart';

class CustomBodyText extends GetView<LocaleController> {
  final String number;
  const CustomBodyText( {required this.number,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          '$number'.tr,
          style:
          Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        ));
  }
}
