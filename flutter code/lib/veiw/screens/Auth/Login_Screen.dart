import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';

import '../../../conttrolar/Auth/LoginController.dart';
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

class Login_Screen extends GetView<LocaleController> {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(LoginControllerImp());

    return Scaffold(

      backgroundColor: Colorapp.backgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colorapp.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Sign In',
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colorapp.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(builder: (controller)=>HandlingDataRequest(widget:  Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Form(
            key: controller.formstatelog,
            child: ListView(
              children: [
                const LogoAuth(),
                const CustomTitleLogin('10'),
                const SizedBox(
                  height: 15,
                ),
                const CustomBodyText(number: '11',),
                const SizedBox(height: 35,),
                CustomTextFormFiled(validator: (val){
                  return ValidInput(val!,5,20,'email');
                },
                  hintText: 'Enter Your Email',suffixIcon: Icons.email_outlined,label: 'Email',myController:controller.email,),
                const SizedBox(height: 30,),
                GetBuilder<LoginControllerImp>(
                  builder:(controller)=>  CustomTextFormFiled(isPassword: controller.ispasswordShow,onTapIcon: (){controller.isPasswordShown();},validator: (val){
                    return ValidInput(val!,5,9,'password');
                  },hintText: 'Enter Your Password',suffixIcon: Icons.lock_outline,label: 'Password',myController:controller.password,),
                ),
                const SizedBox(height: 5,),
                InkWell(onTap: (){
                  controller.goForgetPassword();
                },child:  Text('Forget Password ?',textAlign: TextAlign.end,style: TextStyle(color: Colorapp.grey),)),
                const SizedBox(height: 20,),
                CustomBottomAuth(onPressed: (){
                  controller.login();
                },text: 'Login',),
                const SizedBox(height: 35,),
                CustomRowToSignInAndUp(textone: 'Don`t Have An Account ?', texttwo: 'Sign Up', ontap: () { controller.goSignUp();  },),

              ],
            ),
          ),
        ),statusRequest: controller.statusRequest,)
           ),
      ),
    );
  }
}
