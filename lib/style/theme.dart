import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



ThemeData lightTheme=ThemeData(

  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.grey),
  ),

  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    selectedItemColor: Colors.amber[800],

    elevation: 20.0,
    unselectedItemColor: Colors.grey,
    backgroundColor:  Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: Colors.black,
      height: 1.3,
    ),
  ),
);


ThemeData darkTheme=ThemeData(

  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:  Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontFamily: 'Batman',
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.black
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor:Colors.amber[800],
    elevation: 20.0,
    unselectedItemColor: Colors.grey,
    backgroundColor:  Colors.grey,
  ),
  scaffoldBackgroundColor: Colors.grey,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: Colors.white,
      height: 1.3,
    ),
  ),
);
