import 'dart:convert';
import 'dart:ui';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart'as http;

Set<Polyline> polylineSet={};
List<LatLng> polylineco=[];
PolylinePoints polylinePoints =PolylinePoints();
Future<void> getPolyline(lat,long,deslat,deslong)async{
String url="https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$deslat,$deslong&key=AIzaSyDRMSn12WcXGN6dYCM8MCUEK3T1KO8oIzM";
var response=await http.post(Uri.parse(url));
var responseboody=jsonDecode(response.body);
var point=responseboody['routes'][0]['overview_polyline']['points'];
List<PointLatLng> result = polylinePoints.decodePolyline(point);
if(result.isNotEmpty){
  result.forEach((PointLatLng pointLatLng) {
    polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));

  });

}
Polyline polyline=Polyline(polylineId: PolylineId('Ahmed'),color:Color(0xff3498db),width: 5,points: polylineco);
polylineSet.add(polyline);
}