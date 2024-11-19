import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Colors.white,
  dividerColor: Colors.white38,
  highlightColor: Colors.purple,
  primaryColor: Colors.white,
  hintColor: Colors.black,
  cardColor: Colors.grey[300],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 15),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      )),
      backgroundColor: WidgetStatePropertyAll(Colors.purple),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
);