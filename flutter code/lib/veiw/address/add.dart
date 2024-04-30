import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoppapp/core/classes/handlingDataView.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';
import 'package:shoppapp/veiw/widget/Auth/CustomBottonAuth.dart';

import '../../conttrolar/address/add.dart';
import '../../core/consstans/color/colorapp.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController addAddressController = Get.put(AddAddressController());

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add Address",
          ),
          backgroundColor: Colorapp.primaryColor,
        ),
        body:GetBuilder<AddAddressController>(builder:(addAddressController)=> HandlingDataView(statusRequest: addAddressController.statusRequest,widget:

       Column(
          children: [
            if (addAddressController.kGooglePlex != null)  Expanded (
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap (
                    mapType: MapType.normal,
                    markers: addAddressController.markers.toSet(),
                    onTap: (latlong){
                      addAddressController.addMarkers(latlong);
                    },
                    initialCameraPosition: addAddressController.kGooglePlex!,
                    onMapCreated: (GoogleMapController controller) {
                      addAddressController.completerController
                      !.complete(controller);
                    },
                  ),
                  Positioned(
                      bottom: 10,
                      child: Container(
                        height: 60,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colorapp.primaryColor,
                          borderRadius: BorderRadius.circular(17)
                        ),
                        child: MaterialButton(child:const Text( "Complete location",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),),onPressed: (){
                          addAddressController.goToPageAddDetailsAddress();
                        },),)),
                ],
              ),

            )
          ],
        ),),));
  }
}
