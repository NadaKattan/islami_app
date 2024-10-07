import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeApp {
  static const Color lightPrimary = Color(0xffB7935F);
  static const Color darkPrimary = Color(0xff141A2E);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff242424);
  static const Color gold = Color(0xffFACC1D);
  static ThemeData lightThemeData = ThemeData(
      primaryColor: lightPrimary,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.brown),
          // foregroundColor: Colors.amber,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      // iconTheme: IconThemeData(color: gold),

      textTheme: const TextTheme(
          headlineSmall: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: black),
          titleLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: black)),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: lightPrimary,
        selectedItemColor: black,
        unselectedItemColor: white,
      ));
  static ThemeData darkThemeData = new ThemeData(primaryColor: darkPrimary);
}
