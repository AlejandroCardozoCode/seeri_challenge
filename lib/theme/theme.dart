import 'package:flutter/material.dart';

class ThemeApp {
  static Color black_1 = const Color.fromARGB(255, 20, 20, 20);
  static Color black_2 = const Color.fromARGB(255, 0, 0, 0);
  static Color black_3 = const Color.fromARGB(255, 40, 40, 40);
  static Color blue = const Color.fromARGB(255, 15, 122, 237);

  static final ThemeData light = ThemeData.light().copyWith(
      primaryColor: black_1,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: black_3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: const Size(120, 10),
        ),
      ),
      textTheme: TextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ));
}
