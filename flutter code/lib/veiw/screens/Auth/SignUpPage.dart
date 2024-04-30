import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';

import '../../../conttrolar/Auth/LoginController.dart';
import '../../../conttrolar/Auth/SignUpController.dart';
import '../../../core/classes/handlingDataView.dart';
import '../../../core/consstans/color/colorapp.dart';
import '../../../core/functions/ValidInput.dart';
import '../../../core/functions/alertExitApp.dart';
import '../../../core/localization/changelang.dart';
import '../../widget/Auth/CustomBodyText.dart';
import '../../widget/Auth/CustomBottonAuth.dart';
import '../../widget/Auth/CustomRowToSignIn&Up.dart';
import '../../widget/Auth/CustomTextFormFiled.dart';
import '../../widget/Auth/CustomTiltelLogin.dart';
import '../../widget/Auth/LogoAuth.dart';

class SignUpPage extends GetView<LocaleController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());

    return Scaffold(

      backgroundColor: Colorapp.backgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colorapp.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Sign up',
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colorapp.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child:GetBuilder<SignUpControllerImp>(builder: (controller)=>HandlingDataRequest(widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Form(
            key: controller.formstateSign,
            child: ListView(
              children: [

                const CustomTitleLogin('10'),
                const SizedBox(
                  height: 15,
                ),
                const CustomBodyText(number: '11',),
                const SizedBox(height: 35,),
                CustomTextFormFiled(validator: (val){
                  return ValidInput(val!,5,20,'username');
                },hintText: 'Enter Your Name',suffixIcon: Icons.person,label: 'User name',myController:controller.username,),
                const SizedBox(height: 30,),
                CustomTextFormFiled(validator: (val){
                  return ValidInput(val!,5,20,'email');
                },hintText: 'Enter Your Email',suffixIcon: Icons.email_outlined,label: 'Email',myController:controller.email,),
                const SizedBox(height: 30,),
                CustomTextFormFiled(validator: (val){
                  return ValidInput(val!,5,20,'phone');
                },hintText: 'Enter Your Phone',suffixIcon: Icons.phone_android_outlined,label: 'Phone',myController:controller.phone,),
                const SizedBox(height: 30,),
                CustomTextFormFiled(isPassword: true,validator: (val){
                  return ValidInput(val!,5,20,'password');
                },hintText: 'Enter Your Password',suffixIcon: Icons.lock_outline,label: 'Password',myController:controller.password,),
                const SizedBox(height: 5,),

                const SizedBox(height: 20,),
                CustomBottomAuth(onPressed: (){
                  controller.goCheckEmail();
                },text: 'Sign up',),
                const SizedBox(height: 35,),
                CustomRowToSignInAndUp(textone: 'Do You Have An Account ?', texttwo: 'Login Now', ontap: () { controller.goLogin();
                },),

              ],
            ),
          ),
        ),statusRequest: controller.statusRequest,)

            ),
      ),
    );
  }
}
