import 'package:flutter/material.dart';

final lightTheme=ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.light,
  ),
  dividerColor: Colors.white,
  highlightColor: Colors.purple,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      backgroundColor: const WidgetStatePropertyAll(Colors.purple),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
    ),
  ),
);