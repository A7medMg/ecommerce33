import 'package:flutter/material.dart';

import 'color/colorapp.dart';

ThemeData englishTheme= ThemeData(
  appBarTheme: AppBarTheme(

    titleTextStyle:  TextStyle(fontWeight: FontWeight.bold,color: Colorapp.primaryColor,fontSize: 25,fontFamily: 'Cairo'),
    centerTitle: true,
    elevation: 0,

    backgroundColor: Colors.grey[50],
    iconTheme: IconThemeData(color: Colorapp.primaryColor),
  ),
    fontFamily: 'PlayfairDisplay',
    primaryColor: Colors.blue,
    textTheme: const TextTheme(
      displayMedium: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colorapp.black ),
      displayLarge:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colorapp.black ),
      bodyLarge:  TextStyle(height: 1.5,fontWeight: FontWeight.bold,fontSize: 17,color: Colorapp.grey),
    )
);
ThemeData arabicTheme= ThemeData(
    fontFamily: 'Cairo',
    primaryColor: Colors.blue,
    textTheme: const TextTheme(
      displayMedium: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colorapp.black ),
      displayLarge:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colorapp.black ),
      bodyLarge:  TextStyle(height: 1.5,fontWeight: FontWeight.bold,fontSize: 17,color: Colorapp.grey),
    )
);