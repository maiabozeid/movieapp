import 'package:flutter/material.dart';

class MyThemeData{

  static const Color lightBlack = Color(0xFF1A1A1A);

  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
        bodySmall: TextStyle(
            fontSize: 10,
            color: Colors.white,
        )
    )

  );
}