import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/data/datasource/remote/cartData.dart';
import 'package:shoppapp/data/model/cartModel.dart';
import 'package:shoppapp/data/model/couponModel.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/handlingDataController.dart';
import '../core/services/services.dart';

class CartController extends GetxController{
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices=Get.find();
TextEditingController ? controllerCoupon;
  List<CartModel> data = [];
  double priceOrders= 0.0;
  int totalcountitems=0;
  dynamic discountCoupon=0;
  dynamic couponName;
  dynamic couponid;



  CouponModel ? couponModel;

  addToCart(String itemsId)async{

    statusRequest= StatusRequest.loading;
   update();
    var response= await cartData.addCart(myServices.sharedPreferences.getString("id")!,itemsId);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        Get.rawSnackbar(title:"notification", messageText:const Text("operation accomplished successfully"));
        //data.addAll(response['data']);
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();

  }
  deleteFromCart(String itemsId)async{

    statusRequest= StatusRequest.loading;
    update();
    var response= await cartData.deleteCart(myServices.sharedPreferences.getString("id")!,itemsId);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        Get.rawSnackbar(title:"notification", messageText:const Text("operation accomplished successfully"));
        //data.addAll(response['data']);
      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();

  }


  viewCart()async{
    statusRequest= StatusRequest.loading;
    update();
    data.clear();
    var response= await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=='success'){
        if(response['datacart']['status']=='success'){
          List dataresponse=response['datacart']['data'];
          Map dataresponsecountprice=response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems= int.parse( dataresponsecountprice['totalcount'].toString()) ;
          priceOrders=double.parse(dataresponsecountprice['totalprice'].toString());

        }

      }else{
        statusRequest=StatusRequest.failure;
      }

    }
    update();


  }
  checkCoupon()async{
    statusRequest= StatusRequest.loading;
    update();
    var response= await cartData.checkCoupon(controllerCoupon!.text);
    statusRequest=handlingData(response);
    if(statusRequest == StatusRequest.success){
     Map<String,dynamic> dataCoupon=response['data']  ;
     couponModel=CouponModel.fromJson(dataCoupon!);
     discountCoupon=couponModel!.couponDiscount;
     couponName=couponModel!.couponName.toString();
     couponid=couponModel!.couponId;

      }else{
      //  statusRequest=StatusRequest.failure;
      discountCoupon=0;
      couponName=null;
      couponid=null;
      Get.snackbar("Warring", "coupon not valid");
    }
    update();

    }
    goToPageCheckout(){
    if(data.isEmpty) return Get.snackbar("warning","cart is empty");
      Get.toNamed(AppRoute.checkOut,arguments: {
        "couponid":couponid ?? "0",
        "pticeorder":priceOrders.toString(),
        "coupondiscount":discountCoupon.toString(),
      });

    }
getTotalPrice(){
    return (priceOrders - priceOrders *discountCoupon/100);
}

  resetVarCart(){
    totalcountitems=0;
    priceOrders=0.0;
    //data.clear();

  }
  refrespage(){
    resetVarCart();
    viewCart();
  }
  @override
  void onInit() {
    controllerCoupon=TextEditingController();
    viewCart();
    // TODO: implement onInit
    super.onInit();
  }
}