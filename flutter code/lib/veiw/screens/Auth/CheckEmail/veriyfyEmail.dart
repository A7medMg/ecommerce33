import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';


import '../../../../conttrolar/forgetpassword/ForgetPasswordController.dart';
import '../../../../conttrolar/Auth/LoginController.dart';
import '../../../../conttrolar/Auth/SignUpController.dart';
import '../../../../conttrolar/forgetpassword/VerifyCodeController.dart';
import '../../../../conttrolar/Auth/VerifyEmailCode.dart';
import '../../../../core/consstans/color/colorapp.dart';
import '../../../../core/localization/changelang.dart';
import '../../../widget/Auth/CustomBodyText.dart';
import '../../../widget/Auth/CustomBottonAuth.dart';
import '../../../widget/Auth/CustomRowToSignIn&Up.dart';
import '../../../widget/Auth/CustomTextFormFiled.dart';
import '../../../widget/Auth/CustomTiltelLogin.dart';
import '../../../widget/Auth/LogoAuth.dart';

class VerifyEmail extends GetView<LocaleController> {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {

   Get.put(VerifyEmailCodeImp());
    return Scaffold(

      backgroundColor: Colorapp.backgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colorapp.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Verify Email Code',
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colorapp.grey),
        ),
      ),
      body: GetBuilder<VerifyEmailCodeImp>(builder: (controller)=>
          HandlingDataRequest(statusRequest: controller.statusRequest, widget:  Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: ListView(
              children: [

                const CustomTitleLogin('10'),
                const SizedBox(
                  height: 30,
                ),
                const CustomBodyText(number: '39',),
                const SizedBox(height: 35,),
                OtpTextField(
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(15),
                  numberOfFields: 5,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.goSuccessScreen(verificationCode);

                  }, // end onSubmit
                ),

                const SizedBox(height: 5,),

                const SizedBox(height: 30,),
                InkWell(onTap: (){
                  controller.reSend();
                },child: Center(child: Text("Resend Code",style: TextStyle(color: Colorapp.primaryColor,fontSize: 25,fontWeight: FontWeight.bold),),),)




              ],
            ),
          ),)
         ),
    );
  }
}
