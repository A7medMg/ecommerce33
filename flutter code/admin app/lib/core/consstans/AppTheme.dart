import 'package:flutter/material.dart';

import 'color/colorapp.dart';

ThemeData englishTheme= ThemeData(
  appBarTheme: AppBarTheme(

    titleTextStyle:  TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25,fontFamily: 'Cairo'),
    centerTitle: true,
    elevation: 0,

    backgroundColor: Colorapp.primaryColor,
    iconTheme: IconThemeData(color: Colors.white),
  ),
    fontFamily: 'PlayfairDisplay',
    primaryColor: Colors.blue,
    textTheme: const TextTheme(
      headline2: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colorapp.black ),
      headline1:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colorapp.black ),
      bodyText1:  TextStyle(height: 1.5,fontWeight: FontWeight.bold,fontSize: 17,color: Colorapp.grey),
    )
);
ThemeData arabicTheme= ThemeData(
    fontFamily: 'Cairo',
    primaryColor: Colors.blue,
    textTheme: const TextTheme(
      headline2: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colorapp.black ),
      headline1:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colorapp.black ),
      bodyText1:  TextStyle(height: 1.5,fontWeight: FontWeight.bold,fontSize: 17,color: Colorapp.grey),
    )
);