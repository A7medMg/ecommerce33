import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopadmin/conttrolar/orders/ordersDetails.dart';
import 'package:shopadmin/conttrolar/trackingController.dart';


import '../../../core/classes/handlingDataView.dart';
import '../../../core/functions/Getdecodepolyline.dart';

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({super.key});

  @override
  Widget build(BuildContext context) {

        TrackingController trackingController=Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title:const Text("Orders Tracking"),
      ),
      body: Container(
        padding:const EdgeInsets.symmetric( vertical: 10),
        child: GetBuilder<TrackingController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
            
              
         Expanded(
           child: Container(
               padding:const EdgeInsets.symmetric( vertical: 10),

               width: double.infinity,
               child: GoogleMap(
                 polylines: polylineSet,
                 mapType: MapType.normal,
                 markers: controller.markers.toSet(),
                 initialCameraPosition:
                 controller.kGooglePlex!,
                 onMapCreated: (GoogleMapController controllerMap) {
                   controller.gmc=controllerMap;
                 },
               ),
             ),
         )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
