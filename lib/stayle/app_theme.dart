import 'package:flutter/material.dart';
import 'colors.dart';

class AppThemeing {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: greenBackgroundColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: blueColor,
      onPrimary: Colors.white,
      secondary: blackColor,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white30,
      onSurface: Colors.white30,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: blueColor,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: blueColor,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: const TextTheme(
        titleSmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w600, color: greenColor),
        titleLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w900, color: blueColor),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: blueColor,
      ));

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkPrimary,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: blueColor,
        onPrimary: Colors.white,
        secondary: blackColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white30,
        onSurface: Colors.white30),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: blueColor,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: blueColor,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: const TextTheme(
        titleSmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.normal, color: blackColor),
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w600, color: greenColor),
        titleLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w900, color: blueColor),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: blueColor,
      ));
}
