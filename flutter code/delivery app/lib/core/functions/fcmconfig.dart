import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../conttrolar/orders/pendingController.dart';
requestPremissionNotification()async{


  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
fcmconfig(){
  FirebaseMessaging.onMessage.listen((message) {
 print("============Notification===============");
 print(message.notification!.title);
 print(message.notification!.body);
 FlutterRingtonePlayer.playNotification();
 Get.snackbar(message.notification!.title.toString(), message.notification!.body.toString());
 refreshPageNotification(message.data);
  });
}
refreshPageNotification(data){
print(data["pageid"]);
print(data["pagename"]);
if(Get.currentRoute =="/pendingorders" &&data["pagename"]=="refreshorderpending"){
  OrdersPendingController controller=Get.find();
  controller.refreshOrders();
}


}