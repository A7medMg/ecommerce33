import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';

import '../../../../conttrolar/forgetpassword/ForgetPasswordController.dart';
import '../../../../conttrolar/Auth/LoginController.dart';
import '../../../../conttrolar/Auth/SignUpController.dart';
import '../../../../conttrolar/forgetpassword/VerifyCodeController.dart';
import '../../../../core/classes/handlingDataView.dart';
import '../../../../core/consstans/color/colorapp.dart';
import '../../../../core/localization/changelang.dart';
import '../../../widget/Auth/CustomBodyText.dart';
import '../../../widget/Auth/CustomBottonAuth.dart';
import '../../../widget/Auth/CustomRowToSignIn&Up.dart';
import '../../../widget/Auth/CustomTextFormFiled.dart';
import '../../../widget/Auth/CustomTiltelLogin.dart';
import '../../../widget/Auth/LogoAuth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller =
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colorapp.backgroundcolor,
        elevation: 0.0,
        title: Text('Verification Code',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colorapp.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTitleLogin('10'),
          const SizedBox(
            height: 30,
          ),
          const CustomBodyText(number: '39',),

          const SizedBox(height: 15),
          OtpTextField(

            fieldWidth: 50.0,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor:const  Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {

            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              controller.goToResetPassword(verificationCode) ;
            }, // end onSubmit
          ),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
