import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shopadmin/conttrolar/orders/archive_Controller.dart';
import 'package:shopadmin/core/classes/handlingDataView.dart';
import 'package:shopadmin/core/consstans/color/colorapp.dart';
import 'package:shopadmin/core/consstans/namesRout.dart';
import 'package:shopadmin/data/model/ordersModel.dart';
import 'package:shopadmin/veiw/screens/orders/ratingdialog.dart';

import '../../../conttrolar/orders/pendingController.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersArchiveController ordersArchiveController=Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archive Orders"),
      ),
      body: Container(
        padding:const EdgeInsets.all(10),
        child: GetBuilder<OrdersArchiveController>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
          itemBuilder: (context,index)=>CardOrdersList(listdata: controller.data[index],),
          itemCount:controller.data.length ,



        )),),
      ),
    );
  }
}
class CardOrdersList extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;
  const CardOrdersList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Container(
        padding:const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Order Number: #${listdata.ordersId}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,fontFamily: "sans"),),
                Spacer(),
                Text("${Jiffy.parse(listdata.ordersDatetime!).fromNow()}",style: TextStyle(fontFamily: "sans"),),
              ],
            ),
            Divider(),
            Text("Order Type: ${controller.printOrdersType(listdata.ordersType!.toString())}",style: TextStyle(fontFamily: 'Cairo',fontSize: 15),),
            Text("Order Price:${listdata.ordersPrice}\$",style: TextStyle(fontFamily: 'Cairo',fontSize: 15),),
            Text("Delivery Price: ${listdata.ordersPricedelivery} \$",style: TextStyle(fontFamily: 'Cairo',fontSize: 15),),
            Text("Payment Method:${controller.printPaymentMethod(listdata.ordersPaymentmethode!.toString())}",style: TextStyle(fontFamily: 'Cairo',fontSize: 15),),
            Text("Order Status:${controller.printOrdersStatus(listdata.ordersStatus!.toString())}",style: TextStyle(fontFamily: 'Cairo',fontSize: 15),),

            Divider(),
            Row(
              children: [
                Text("Total Price: ${listdata.ordersTotalprice}\$",style: TextStyle(fontFamily: 'sans',fontSize: 20,color: Colorapp.primaryColor),),
                Spacer(),
                MaterialButton(onPressed: (){
                  Get.toNamed(AppRoute.OrdersDetails,arguments: {
                    "ordersmodel":listdata,
                  });
                },child: Text("Details"),color:Colorapp.secondColor,textColor: Colors.white,),
                SizedBox(width: 10,),
               if(listdata.ordersRatting.toString() =='0') MaterialButton(onPressed: (){
                  showDialogRating(context,listdata.ordersId.toString());
                },child: Text("Rating"),color:Colorapp.secondColor,textColor: Colors.white,),

              ],
            ),





          ],
        ),
      ),
    );
  }
}
