import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightBlack = Color(0xFF1A1A1A);

  static ThemeData appTheme = ThemeData(
      appBarTheme: AppBarTheme(
        color: Color(0xFF1D1E1D),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white
        )
      ),
      scaffoldBackgroundColor: Colors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.yellow, unselectedItemColor: Colors.white),

      textTheme: TextTheme(displayMedium: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(fontSize: 13, color: Colors.grey,
          ),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 10,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)));
}
