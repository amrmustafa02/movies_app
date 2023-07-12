import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  // static const Color primeColor = Color(0xFFD98639);
  static const Color primeColor = Color(0xFFE51937);

  static var myTheme = ThemeData(

    textTheme: const TextTheme(),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        shadowColor: Colors.transparent),
    primaryColor: primeColor,
    // 0F1B2B
    // 0xFF1E1F27
    scaffoldBackgroundColor: const Color(0xFF0F1B2B),
  );
}
