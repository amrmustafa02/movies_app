import 'package:flutter/material.dart';
import 'package:movies/main/my_theme.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "login-screen";
  bool isPassword = false;
  Icon icon = const Icon(
    Icons.visibility_off_outlined,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: MyTheme.secondColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15)),
              child: Expanded(
                child: TextFormField(
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.2), fontSize: 12),
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (isPassword) {
                              icon = const Icon(Icons.visibility);
                            } else if (!isPassword) {
                              icon = const Icon(Icons.visibility_off_outlined);
                            }
                            isPassword = !isPassword;
                            // setState(() {
                            // });
                          },
                          icon: icon),
                      suffixIconColor: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
