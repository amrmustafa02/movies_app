import 'package:flutter/material.dart';
import 'package:movies/ui/login_signup_screen/login_screen.dart';
import 'package:movies/ui/shared/page_route.dart';

class NoUserItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            width: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    PageRouteUtils.createRoute(LoginScreen(), 0.0, 1.0));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return Theme.of(context)
                          .primaryColor; // Defer to the widget's default.
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide.none))),
              child: const Text("Go To Login Screen"),
            )),
      ],
    ));
  }
}
