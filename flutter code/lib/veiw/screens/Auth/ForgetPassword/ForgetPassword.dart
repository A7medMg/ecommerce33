import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';

import '../../../../conttrolar/forgetpassword/ForgetPasswordController.dart';
import '../../../../conttrolar/Auth/LoginController.dart';
import '../../../../conttrolar/Auth/SignUpController.dart';
import '../../../../core/classes/handlingDataView.dart';
import '../../../../core/consstans/color/colorapp.dart';
import '../../../../core/functions/ValidInput.dart';
import '../../../../core/localization/changelang.dart';
import '../../../widget/Auth/CustomBodyText.dart';
import '../../../widget/Auth/CustomBottonAuth.dart';
import '../../../widget/Auth/CustomRowToSignIn&Up.dart';
import '../../../widget/Auth/CustomTextFormFiled.dart';
import '../../../widget/Auth/CustomTiltelLogin.dart';
import '../../../widget/Auth/LogoAuth.dart';

class ForgetPassword extends GetView<LocaleController> {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {

   Get.put(ForgetPasswordControllerImp());
    return Scaffold(

      backgroundColor: Colorapp.backgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colorapp.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Forget Password',
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colorapp.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller)=>HandlingDataRequest
        (statusRequest: controller.statusRequest,
        widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [

                const CustomTitleLogin('27'),
                const SizedBox(
                  height: 15,
                ),
                const CustomBodyText(number: '29',),
                const SizedBox(height: 35,),
                CustomTextFormFiled(validator: (val){
                  return ValidInput(val!,5,20,'email');
                },hintText: 'Enter Your email',suffixIcon: Icons.email,label: 'User email',myController:controller.email,),


                const SizedBox(height: 5,),

                const SizedBox(height: 20,),
                CustomBottomAuth(onPressed: (){
                  controller.checkEmail();
                },text: 'Send Code',),



              ],
            ),
          ),
        ),)

        )
    );
  }
}
