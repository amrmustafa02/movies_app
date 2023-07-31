import 'package:flutter/material.dart';
import 'package:movies/ui/login_signup_screen/my_password_form.dart';

import '../../my_theme.dart';

class MyTextForm extends StatefulWidget {
  vaild validator;
  TextEditingController controller = TextEditingController();
  IconData icon;
  String hintName;

  @override
  State<MyTextForm> createState() => _MyTextFormState();

  MyTextForm(
      {super.key,
      required this.validator,
      required this.controller,
      required this.icon,
      required this.hintName});
}

class _MyTextFormState extends State<MyTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: MyTheme.secondColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        // ignore: prefer_const_constructors
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
          border: InputBorder.none,
          hintText: widget.hintName,
          hintStyle:
              TextStyle(color: Colors.grey.withOpacity(0.2), fontSize: 12),
          prefixIcon: Icon(
            widget.icon,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
