import 'package:flutter/material.dart';

import 'color/colorapp.dart';

ThemeData englishTheme= ThemeData(
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