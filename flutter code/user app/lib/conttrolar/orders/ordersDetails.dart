import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoppapp/data/datasource/remote/orders/details.dart';
import 'package:shoppapp/data/model/cartModel.dart';
import 'package:shoppapp/data/model/ordersModel.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/functions/handlingDataController.dart';

class OrdersDetailsController extends GetxController{
  OrdersModel ? ordersModel;
 StatusRequest statusRequest = StatusRequest.loading;
 Completer<GoogleMapController> ? completerController;
 List<Marker> markers = [];
 CameraPosition ? kGooglePlex ;
 double? lat;
 double? long;

 initialData(){
  if(ordersModel!.ordersType.toString() =="0"){
   kGooglePlex= CameraPosition(
    target: LatLng(double.parse(ordersModel!.addressLat.toString()), double.parse(ordersModel!.addressLong.toString())),

    zoom: 10.4746,
   );
   markers.add(Marker(markerId: MarkerId("1"),position: LatLng(double.parse(ordersModel!.addressLat.toString()), double.parse(ordersModel!.addressLong.toString())) ));



  }

 }


 @override
  void onInit() {
  ordersModel=Get.arguments['ordersmodel'];
  initialData();

  completerController = Completer<GoogleMapController>();

  getData();


    // TODO: implement onInit
    super.onInit();
  }
 OrdersDetailData ordersDetailData=OrdersDetailData(Get.find());
 List<CartModel> data=[];

 getData()async{
  statusRequest= StatusRequest.loading;
  var response= await ordersDetailData.getData(ordersModel!.ordersId.toString());
  statusRequest=handlingData(response);
  if(statusRequest == StatusRequest.success){
   if(response['status']=='success'){
    List dataResponse=response['data'];
    data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
   }else{
    statusRequest=StatusRequest.failure;
   }

  }
  update();
 }
}

