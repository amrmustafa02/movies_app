import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextUtils {
  static showText(String text, double size) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFFF75F46), Color(0xFFFF8F71)],
      ).createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: Colors.white,
        ),
      ),
    );
  }
  static getReleaseDate(String? date) {
    if(date==null){
      return "";
    }
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('MMM d, yyyy').format(dateTime);
  }
}
