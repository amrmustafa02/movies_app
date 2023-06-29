import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const Color _primeColor = Color(0xFFD98639);

  static var myTheme = ThemeData(

    textTheme: const TextTheme(

    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        shadowColor: Colors.transparent),
    primaryColor: _primeColor,
    scaffoldBackgroundColor: const Color(0xFF1E1F27),
  );
}
