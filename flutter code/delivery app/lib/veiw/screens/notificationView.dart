import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import 'package:shopadmin/conttrolar/notificationController.dart';
import 'package:shopadmin/core/classes/handlingDataView.dart';

class NotificationView  extends StatelessWidget {
  const NotificationView ({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller=Get.put(NotificationController());
    return  Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: GetBuilder<NotificationController>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: Container(

        child: ListView(
          children: [


            ...List.generate(controller.data.length, (index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(controller.data[index]['notification_title'],style: TextStyle(fontFamily: "Cairo",fontWeight: FontWeight.bold),),
                ),
                subtitle: Text(controller.data[index]['notification_body']),
                trailing: Text("${Jiffy.parse(controller.data[index]['notification_datetime']).fromNow()}",style: TextStyle(fontFamily: "sans"),),
              ),
            ))

          ],
        ),
      )),),
    );
  }
}
