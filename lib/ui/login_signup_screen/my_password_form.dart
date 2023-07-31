import 'package:flutter/material.dart';

import '../../my_theme.dart';

typedef vaild = String? Function(String?);

class MyPasswordForm extends StatefulWidget {
  bool secure = true;
  Icon icon = Icon(
    Icons.visibility_off_rounded,
    color: Colors.grey.withOpacity(0.5),
  );
  TextEditingController controller;
  vaild validator;
  String hintText = "";

  MyPasswordForm(
      {super.key, required this.validator, required this.controller});

  @override
  State<MyPasswordForm> createState() => _MyPasswordFormState();
}

class _MyPasswordFormState extends State<MyPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: MyTheme.secondColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        validator: widget.validator,
        obscureText: widget.secure,
        controller: widget.controller,
        // ignore: prefer_const_constructors
        style: TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none,
            hintText: "Password",
            hintStyle:
                TextStyle(color: Colors.grey.withOpacity(0.2), fontSize: 12),
            prefixIcon: Icon(
              Icons.lock_rounded,
              color: Colors.grey.withOpacity(0.8),
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  if (widget.secure) {
                    widget.icon = const Icon(Icons.visibility_rounded);
                  } else {
                    widget.icon = const Icon(Icons.visibility_off_rounded);
                  }
                  widget.secure = !widget.secure;
                  setState(() {});
                },
                icon: widget.icon),
            suffixIconColor: Colors.grey.withOpacity(0.5)),
      ),
    );
  }
}
