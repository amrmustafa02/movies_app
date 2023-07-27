import 'package:flutter/material.dart';

class MyTheme {
  static const Color primeColor = Color(0xFFE51937);
  // static const Color primeColor = Color(0xFF9B2121);

  static var myTheme = ThemeData(
    canvasColor: Colors.transparent,
    textTheme: const TextTheme(),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        shadowColor: Colors.transparent),

    primaryColor: primeColor,

    scaffoldBackgroundColor: const Color(0xFF0F1B2B),
    // scaffoldBackgroundColor: const Color(0xFF18181B),

  );
}
