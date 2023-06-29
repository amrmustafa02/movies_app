import 'package:flutter/material.dart';

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
}
