import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shoppapp/core/localization/changelang.dart';

class CustomTitleLogin extends GetView<LocaleController> {
  final String number;
  const CustomTitleLogin(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
      '$number'.tr,
      style: Theme.of(context).textTheme.headline2,
      textAlign: TextAlign.center,
    );
  }
}
