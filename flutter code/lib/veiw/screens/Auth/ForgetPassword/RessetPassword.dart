import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shoppapp/conttrolar/forgetpassword/ResetPasswordController.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';

import '../../../../conttrolar/forgetpassword/ForgetPasswordController.dart';
import '../../../../conttrolar/Auth/LoginController.dart';
import '../../../../conttrolar/Auth/SignUpController.dart';
import '../../../../core/classes/handlingDataView.dart';
import '../../../../core/consstans/color/colorapp.dart';
import '../../../../core/localization/changelang.dart';
import '../../../widget/Auth/CustomBodyText.dart';
import '../../../widget/Auth/CustomBottonAuth.dart';
import '../../../widget/Auth/CustomRowToSignIn&Up.dart';
import '../../../widget/Auth/CustomTextFormFiled.dart';
import '../../../widget/Auth/CustomTiltelLogin.dart';
import '../../../widget/Auth/LogoAuth.dart';

class ResetPassword extends GetView<LocaleController> {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {

   Get.put(ResetPasswordControllerImp());
    return Scaffold(

      backgroundColor: Colorapp.backgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colorapp.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Reset Password',
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colorapp.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(builder: (controller)=>HandlingDataRequest(widget:  Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [

              const CustomTitleLogin('40'),
              const SizedBox(
                height: 15,
              ),
              const CustomBodyText(number: '40',),
              const SizedBox(height: 35,),
              CustomTextFormFiled(isPassword: true,validator: (val){},hintText: 'Enter New Password',suffixIcon: Icons.lock_outline,label: 'new Password',myController:controller.password,),
              const SizedBox(height: 35,),
              CustomTextFormFiled(isPassword: true,validator: (val){},hintText: ' Re Enter Password',suffixIcon: Icons.lock_outline,label: 'Confirm Password',myController:controller.confirmpassword,),


              const SizedBox(height: 5,),

              const SizedBox(height: 20,),
              CustomBottomAuth(onPressed: (){
                controller.goToSuccess();

              },text: 'Submit',),



            ],
          ),
        ),
      ),statusRequest: controller.statusRequest,),)

    );
  }
}
