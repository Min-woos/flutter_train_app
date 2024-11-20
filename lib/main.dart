import 'package:flutter/material.dart';
import 'package:flutter_train_app/home/home_page.dart';
import 'package:flutter_train_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '기차 예매',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      home: const HomePage(),
    );
  }
}