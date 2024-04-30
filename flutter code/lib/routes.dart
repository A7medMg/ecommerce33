import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/Middleware/Middleware.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/test_veiw.dart';
import 'package:shoppapp/testx.dart';
import 'package:shoppapp/veiw/Home.dart';
import 'package:shoppapp/veiw/address/add.dart';
import 'package:shoppapp/veiw/address/addDetails.dart';
import 'package:shoppapp/veiw/address/view.dart';

import 'package:shoppapp/veiw/screens/Auth/CheckEmail/SuccessScreenEmail.dart';
import 'package:shoppapp/veiw/screens/Auth/CheckEmail/veriyfyEmail.dart';
import 'package:shoppapp/veiw/screens/Auth/ForgetPassword/ForgetPassword.dart';
import 'package:shoppapp/veiw/screens/Auth/Login_Screen.dart';
import 'package:shoppapp/veiw/screens/Auth/ForgetPassword/RessetPassword.dart';
import 'package:shoppapp/veiw/screens/Auth/ForgetPassword/Success_Screen_restetpassword.dart';
import 'package:shoppapp/veiw/screens/Auth/ForgetPassword/VerifyCode.dart';
import 'package:shoppapp/veiw/screens/Homescreen.dart';
import 'package:shoppapp/veiw/screens/MyFavorite.dart';
import 'package:shoppapp/veiw/screens/OnBoardin_Screen.dart';
import 'package:shoppapp/veiw/screens/Auth/SignUpPage.dart';
import 'package:shoppapp/veiw/screens/cart..dart';
import 'package:shoppapp/veiw/screens/items.dart';
import 'package:shoppapp/veiw/screens/language.dart';
import 'package:shoppapp/veiw/screens/productdetails.dart';
List<GetPage<dynamic>>routes=[
   GetPage(name: '/', page: ()=>const Language_Screen(),middlewares:[MyMiddleware()]),
  //GetPage(name: '/', page: ()=> CartScreen()),

   //GetPage(name: '/', page: ()=> Test_View()),
   GetPage(name: AppRoute.Home_Page, page: ()=>const HomeScreen()),
   GetPage(name: AppRoute.Login, page: ()=>const Login_Screen()),
   GetPage(name: AppRoute.onBoarding, page: ()=>const  OnBoardin_Screen()),
   GetPage(name: AppRoute.signUp, page: ()=>const SignUpPage()),
   GetPage(name: AppRoute.forgetPassword, page: ()=>const ForgetPassword()),
   GetPage(name: AppRoute.verifycode, page: ()=>const VerifyCode()),
   GetPage(name: AppRoute.resetPassword, page: ()=>const ResetPassword()),
   GetPage(name: AppRoute.success_Screen_Reset, page: ()=>const Success_Screen()),
   GetPage(name: AppRoute.successScreenEmail, page: ()=>const SuccessScreenEmail()),
   GetPage(name: AppRoute.verifyEmailCode, page: ()=>const VerifyEmail()),
   GetPage(name: AppRoute.items, page: ()=>const ItemsView()),
   GetPage(name: AppRoute.productDetails, page: ()=>const ProductDetails()),
   GetPage(name: AppRoute.myFavorite, page: ()=>const MyFavorite()),
   GetPage(name: AppRoute.cartView, page: ()=>const CartScreen()),
   GetPage(name: AppRoute.addressView, page: ()=>const AddressView()),
   GetPage(name: AppRoute.addressAdd, page: ()=> AddressAdd()),
   GetPage(name: AppRoute.addressAddDetails, page: ()=>  AddressAddDetails()),







];

/*
Map<String, Widget Function(BuildContext)> routess={
   AppRoute.Login:(context)=>const Login_Screen(),
   AppRoute.onBoarding:(context)=>const OnBoardin_Screen(),
   AppRoute.signUp:(context)=>const SignUpPage(),
   AppRoute.forgetPassword:(context)=>const ForgetPassword(),
   AppRoute.verifycode:(context)=>const VerifyCode(),
   AppRoute.resetPassword:(context)=>const ResetPassword(),
   AppRoute.success_Screen_Reset:(context)=>const Success_Screen(),
   AppRoute.successScreenEmail:(context)=>const SuccessScreenEmail(),

   AppRoute.verifyEmailCode:(context)=>const VerifyEmail(),
};*/
