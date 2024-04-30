import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../conttrolar/Auth/SignUpController.dart';
import '../../../../core/consstans/color/colorapp.dart';
import '../../../widget/Auth/CustomBottonAuth.dart';

class Success_Screen extends StatelessWidget {
  const Success_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controll=Get.put(SignUpControllerImp());
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colorapp.backgroundcolor,
        elevation: 0.0,
        title: Text('32'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colorapp.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: Colorapp.primaryColor,
              )),
          Text("37".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          Text("38".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomBottomAuth(
                text: "31".tr,
                onPressed: () {
                  controll.goLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
