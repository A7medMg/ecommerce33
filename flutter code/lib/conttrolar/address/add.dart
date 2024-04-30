import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoppapp/core/classes/statusrequest.dart';

import '../../core/consstans/namesRout.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
   Completer<GoogleMapController> ? completerController;
  List<Marker> markers = [];
  CameraPosition ? kGooglePlex ;
  double? lat;
  double? long;
  Position  ?postion;
  void onInit() {
    // TODO: implement onInit
    completerController = Completer<GoogleMapController>();
    super.onInit();
    getCurrentLocation();
  }


  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }
  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressAddDetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  getCurrentLocation()async{
    postion=await Geolocator.getCurrentPosition();
    kGooglePlex= CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }


}
