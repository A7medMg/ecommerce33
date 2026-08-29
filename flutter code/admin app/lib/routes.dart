import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopadmin/core/Middleware/Middleware.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';

import 'package:shopadmin/test_veiw.dart';
import 'package:shopadmin/testx.dart';
import 'package:shopadmin/veiw/OrdersScreen.dart';
import 'package:shopadmin/veiw/address/add.dart';
import 'package:shopadmin/veiw/address/addDetails.dart';
import 'package:shopadmin/veiw/address/view.dart';
import 'package:shopadmin/veiw/home.dart';


import 'package:shopadmin/veiw/screens/Auth/CheckEmail/SuccessScreenEmail.dart';
import 'package:shopadmin/veiw/screens/Auth/CheckEmail/veriyfyEmail.dart';
import 'package:shopadmin/veiw/screens/Auth/ForgetPassword/ForgetPassword.dart';
import 'package:shopadmin/veiw/screens/Auth/Login_Screen.dart';
import 'package:shopadmin/veiw/screens/Auth/ForgetPassword/RessetPassword.dart';
import 'package:shopadmin/veiw/screens/Auth/ForgetPassword/Success_Screen_restetpassword.dart';
import 'package:shopadmin/veiw/screens/Auth/ForgetPassword/VerifyCode.dart';
import 'package:shopadmin/veiw/screens/Homescreen.dart';

import 'package:shopadmin/veiw/screens/OnBoardin_Screen.dart';
import 'package:shopadmin/veiw/screens/Auth/SignUpPage.dart';
import 'package:shopadmin/veiw/screens/categories/add.dart';
import 'package:shopadmin/veiw/screens/categories/categoriesview.dart';
import 'package:shopadmin/veiw/screens/categories/edit.dart';
import 'package:shopadmin/veiw/screens/items/add.dart';
import 'package:shopadmin/veiw/screens/items/categoriesview.dart';
import 'package:shopadmin/veiw/screens/items/edit.dart';

import 'package:shopadmin/veiw/screens/language.dart';
import 'package:shopadmin/veiw/screens/notificationView.dart';
import 'package:shopadmin/veiw/screens/orders/achive.dart';
import 'package:shopadmin/veiw/screens/orders/details.dart';
import 'package:shopadmin/veiw/screens/orders/pending.dart';
import 'package:shopadmin/veiw/screens/setingedit.dart';
import 'package:shopadmin/veiw/screens/usersScreenUsers.dart';

List<GetPage<dynamic>>routes=[
   GetPage(name: '/', page: ()=>const Language_Screen(),middlewares:[MyMiddleware()]),
  //GetPage(name: '/', page: ()=> CartScreen()),

   //GetPage(name: '/', page: ()=> Test_View()),


   GetPage(name: AppRoute.Home_Page, page: ()=>const Home_Page()),
   GetPage(name: AppRoute.Login, page: ()=>const Login_Screen()),
   GetPage(name: AppRoute.onBoarding, page: ()=>const  OnBoardin_Screen()),
   GetPage(name: AppRoute.signUp, page: ()=>const SignUpPage()),
   GetPage(name: AppRoute.forgetPassword, page: ()=>const ForgetPassword()),
   GetPage(name: AppRoute.verifycode, page: ()=>const VerifyCode()),
   GetPage(name: AppRoute.resetPassword, page: ()=>const ResetPassword()),
   GetPage(name: AppRoute.success_Screen_Reset, page: ()=>const Success_Screen()),
   GetPage(name: AppRoute.successScreenEmail, page: ()=>const SuccessScreenEmail()),
   GetPage(name: AppRoute.verifyEmailCode, page: ()=>const VerifyEmail()),

   GetPage(name: AppRoute.addressView, page: ()=>const AddressView()),
   GetPage(name: AppRoute.addressAdd, page: ()=> AddressAdd()),
   GetPage(name: AppRoute.addressAddDetails, page: ()=>  AddressAddDetails()),

   GetPage(name: AppRoute.pendingorders, page: ()=>  OrdersPending()),
   GetPage(name: AppRoute.archiveorders, page: ()=>  OrdersArchive()),
   GetPage(name: AppRoute.NotificationView, page: ()=>  NotificationView()),
   GetPage(name: AppRoute.OrdersDetails, page: ()=>  OrdersDetails()),
   GetPage(name: AppRoute.categoriesView, page: ()=>  CategoriesAdminView()),
   GetPage(name: AppRoute.categoriesAdd, page: ()=>  AddCategoriesAdmin()),
   GetPage(name: AppRoute.categoriesEdite, page: ()=>  EditeCategoriesAdmin()),
   GetPage(name: AppRoute.itemsView, page: ()=>  ItemsAdminView()),
   GetPage(name: AppRoute.itemsAdd, page: ()=>  AddItemsAdmin()),
   GetPage(name: AppRoute.itemsEdite, page: ()=>  EditeItemsAdmin()),
   GetPage(name: AppRoute.UsersViewEdite, page: ()=>  UsersAdminView()),
   GetPage(name: AppRoute.AdminHomeScreen, page: ()=>  HomeScreen()),
   GetPage(name: AppRoute.setting, page: ()=>  SettingEdit()),






















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
