import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/core/consstans/namesRout.dart';

import '../../conttrolar/settingController.dart';
import '../../core/consstans/color/colorapp.dart';
import '../../core/consstans/imageassets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller=  Get.put(SettingsController());
    return Container(
      child: ListView(
        children:[ Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: Get.width / 2.8,
              decoration: const BoxDecoration(color: Colorapp.primaryColor),
            ),
            Positioned(
              top: Get.width / 4,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage:const AssetImage(ImageAssets.avatar),
                  )),
            ),
          ],
        ),
          SizedBox(height: 100,),
          Padding(

            padding: const EdgeInsets.all(15),
            child: Card(child: Column(
              children: [

                ListTile(
                  onTap: (){},
                  trailing: Switch(onChanged: (val){},value: true,),
                  title:const Text("Display Notification"),),
                ListTile(
                  onTap: (){
                    Get.toNamed(AppRoute.addressView);
                  },
                  trailing:const Icon(Icons.location_on_outlined),

                  title:const Text("Address "),),

                ListTile(
                  onTap: (){},
                  trailing:const Icon(Icons.help_outline_outlined),

                  title:const Text("About Us"),),

                ListTile(
                  onTap: (){},
                  trailing:const Icon(Icons.phone),

                  title:const Text("Contact Us"),),






                ListTile(
                  onTap: (){
                    controller.logOut();
                  },
                  trailing:const Icon(Icons.login_outlined),

                  title:const Text("Log Out"),),



              ],
            ),),
          )

        ])
    );
  }
}
