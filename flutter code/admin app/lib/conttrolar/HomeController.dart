import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopadmin/conttrolar/usersView.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';
import 'package:shopadmin/core/services/services.dart';
import 'package:shopadmin/data/datasource/remote/home_data.dart';
import 'package:shopadmin/data/model/itemsmodel.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/handlingDataController.dart';


class HomeControllerImp extends GetxController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String ? lang;
  String titleDiscount="";
  String  bodyDiscount="";
  String deliveryTime='';
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List settingData=[];




  StatusRequest statusRequest = StatusRequest.none;





}