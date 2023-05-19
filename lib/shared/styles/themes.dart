
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colores.dart';

ThemeData lighttheme=ThemeData(
  textTheme:TextTheme(
    bodyText1: TextStyle(
    color: black,
  ),
    headline6: TextStyle(
      color: black,
    ),
    bodyText2: TextStyle(
      color: black,
    ),
    headline5: TextStyle(
      color: black,
    ),
    headline4: TextStyle(
      color: black,
    ),
    headline3: TextStyle(
      color: black,
    ),
    headline2: TextStyle(
      color: black,
    ),
    button: TextStyle(
      color: black,
    ),
    headline1: TextStyle(
      color: black,
    ),

  ),
   scaffoldBackgroundColor: white,
  iconTheme: IconThemeData(
    color: black,
  ),
  primaryIconTheme:IconThemeData(
    color: black,
  ),
   accentIconTheme: IconThemeData(
     color: black,
   ),
   primarySwatch: defultColor,
  // backgroundColor: white,
  primaryColor:defultColor,
  // floatingActionButtonTheme: FloatingActionButtonThemeData(),
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation:0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize:20.0,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 30,
      )

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor:defultColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
  hintColor:black ,
  textSelectionTheme: TextSelectionThemeData(selectionColor: black),
  drawerTheme: DrawerThemeData(
    backgroundColor: white,
    //scrimColor: white,
  ),
  fontFamily: 'Janna',
);

ThemeData darktheme=ThemeData(

  textTheme:TextTheme(
    bodyText1: TextStyle(
    //fontSize: 18.0,
    //fontWeight: FontWeight.w600,
    color: white,
  ),
    headline6: TextStyle(
     // fontSize: 18.0,
     // fontWeight: FontWeight.w600,
      color: white,
    ),
    bodyText2: TextStyle(
      color: white,
    ),
    headline1: TextStyle(
      color: white,
    ),
    button: TextStyle(
      color: white,
    ),
    headline2: TextStyle(
      color: white,
    ),
    headline3: TextStyle(
      color: white,
    ),
    headline4: TextStyle(
      color: white,
    ),
    headline5: TextStyle(
      color: white,
    ),
  ),
   scaffoldBackgroundColor:HexColor('333739'),
  hintColor:white ,

  iconTheme: IconThemeData(
    color: white,
  ),
   primaryIconTheme:IconThemeData(
     color: white,
   ),
   accentIconTheme: IconThemeData(
     color: white,
   ),

  textSelectionTheme: TextSelectionThemeData(selectionColor: white),
   primarySwatch: defultColor,
  // primaryColor:Colors.deepOrange,
   backgroundColor: black,

  // floatingActionButtonTheme: FloatingActionButtonThemeData(),
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: HexColor('333739'),
      elevation:0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize:20.0,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      )

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor:defultColor,
    unselectedItemColor: Colors.white70,
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
  ),
  drawerTheme: DrawerThemeData(
      backgroundColor: HexColor('333739'),
    //scrimColor: HexColor('333739'),
  ),

  fontFamily: 'Janna',
);