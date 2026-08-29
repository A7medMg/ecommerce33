import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/Getdecodepolyline.dart';
import '../data/model/ordersModel.dart';

class TrackingController extends GetxController{
  StreamSubscription<Position>  ?positionStream;
 GoogleMapController ? gmc;
  StatusRequest statusRequest = StatusRequest.success;

  List<Marker> markers = [];
  CameraPosition ? kGooglePlex ;
  double? destlat;
  double? destlong;
  double? currentlat;
  double? currentlong;
  OrdersModel ? ordersModel;
  getCurrentLocation(){
  positionStream = Geolocator.getPositionStream().listen(
    (Position? position) {
      markers.removeWhere((element) => element.markerId.value=="current");

print(position!.latitude);
      print(position!.longitude);
      currentlat=position!.latitude!;
      currentlong=position!.longitude!;
if(gmc !=null){
  gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(position!.latitude!, position!.longitude!)));
}

       markers.add(Marker(markerId: MarkerId("current"),position: LatLng(double.parse(position!.latitude.toString()), double.parse(position!.longitude.toString())) ));
update();
    });
  markers.add(Marker(markerId: MarkerId("dest"),position: LatLng(double.parse(ordersModel!.addressLat.toString()), double.parse(ordersModel!.addressLong.toString())) ));

  }
  initPolyLine()async{
    destlat=double.parse(ordersModel!.addressLat.toString());
    destlong=double.parse(ordersModel!.addressLong.toString());
  await  Future.delayed(Duration(seconds: 1));
    await  getPolyline(currentlat,currentlong,destlat,destlong);
    update();
  }

  @override
  void onInit() {
    ordersModel=Get.arguments['ordersmodel'];

    kGooglePlex= CameraPosition(
      target: LatLng(double.parse(ordersModel!.addressLat.toString()), double.parse(ordersModel!.addressLong.toString())),

      zoom: 10.4746,
    );


    getCurrentLocation();
    initPolyLine();
    super.onInit();
  }
}