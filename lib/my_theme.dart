import 'package:flutter/material.dart';

class MyTheme {
  static const Color primeColor = Color(0xFFE51937);

  // static const Color primeColor = Color(0xFFFF912A);
  static const secondColor = Color(0xFF243554);
  // static const secondColor = Color(0xFFFFA559);

 static var myTheme = ThemeData(
    canvasColor: Colors.transparent,
    textTheme: const TextTheme(),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        shadowColor: Colors.transparent),

    primaryColor: primeColor,

    scaffoldBackgroundColor: const Color(0xFF0F1B2B),
    // scaffoldBackgroundColor: const Color(0xFF180C0C),

  );
}
