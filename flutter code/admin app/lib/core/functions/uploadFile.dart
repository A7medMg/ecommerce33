import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopadmin/core/consstans/color/colorapp.dart';



imageUploadCamera()async{

  final XFile ? file=await ImagePicker().pickImage(source:ImageSource.camera,imageQuality: 90);
  if(file!=null){
    return File(file.path);
  }else{
    return null;
  }
}
fileUploadGallery([isSvg=false])async{
  FilePickerResult ? result =await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions:isSvg ? [
      'SVG',
      'svg'
    ]:[

      'JPG',
      'PNG'
      'png',
      'jpg'
    ]
  );
  if(result!=null){
    return File(result.files.single.path!);
  }else{
    return null;
  }
}
showbottommenu(imageUploadCamera(),fileUploadGallery()){
  Get.bottomSheet(
    Directionality(textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.all(15),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Container(
                child: Text('chose image',style: TextStyle(fontSize: 22,color: Colorapp.primaryColor,fontWeight: FontWeight.bold),),
              ),
              const Padding(padding: EdgeInsets.only(top: 13)),
              ListTile(
                onTap: (){
                  imageUploadCamera();
                  Get.back();

                },
                leading:Icon(Icons.camera_alt) ,
                title: Text('from camera',style: TextStyle(fontSize: 22),),


              ),
              ListTile(
                onTap: (){
                  fileUploadGallery();
                  Get.back();

                },
                leading:Icon(Icons.image) ,
                title: Text('from Gallery',style: TextStyle(fontSize: 22),),


              ),
            ],
          ),
        )

    )
  );
}