import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoppapp/conttrolar/orders/ordersDetails.dart';
import 'package:shoppapp/core/consstans/color/colorapp.dart';

import '../../../core/classes/handlingDataView.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController ordersDetailsController =
        Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Details"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Card(
                  child: Column(
                    children: [
                      Table(
                        children: [
                          TableRow(children: [
                            Text(
                              "Items",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colorapp.primaryColor),
                            ),
                            Text("QTY",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colorapp.primaryColor)),
                            Text("Price",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colorapp.primaryColor)),
                          ]),
                          ...List.generate(controller.data.length, (index) =>  TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text("${controller.data[index].itemsName}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: "sans")),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                               " ${controller.data[index].itmesCount}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontFamily: "sans"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text("${controller.data[index].itemsPrice}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: "sans")),
                            )
                          ]),)


                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          child: Text("price : ${controller.ordersModel!.ordersTotalprice}\$",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colorapp.primaryColor,
                                  fontFamily: "sans"))),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                if(controller.ordersModel!.ordersType.toString() =="0") Card(
                  child: ListTile(
                    title: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Shipping Address",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "${controller.ordersModel!.addressCity}${controller.ordersModel!.addressStreet}"),
                    ),
                  ),
                ),
           if(controller.ordersModel!.ordersType.toString() =="0") Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 300,
                    width: double.infinity,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: controller.markers.toSet(),
                      initialCameraPosition:
                      controller.kGooglePlex!,
                      onMapCreated: (GoogleMapController controllerMap) {
                        controller.completerController!
                            .complete(controllerMap);
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
