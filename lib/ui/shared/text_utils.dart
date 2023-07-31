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
    try {
      if (date == null) {
        return "";
      }
      DateTime dateTime = DateTime.parse(date);
      return DateFormat('MMM d, yyyy').format(dateTime);
    } catch (_) {
      return "";
    }
  }
  static String? checkEmail(String text) {
    if (text.isEmpty) {
      return "Please enter your email";
    }
    if (!RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(text)) {
      return "please enter valid email";
    }
    return null;
  }
  static String? checkPassword(String text) {
    if (text.isEmpty) {
      return "Please enter your password";
    }
    if (text.length < 6) {
      return "please enter at least 6 character";
    }
    return null;
  }

}
