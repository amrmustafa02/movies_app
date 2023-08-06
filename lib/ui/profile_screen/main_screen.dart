import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:movies/ui/splash_screen.dart';
import 'package:movies/ui/components/no_user_item.dart';
import 'package:movies/ui/profile_screen/change_password_screen.dart';
import 'package:movies/ui/shared/dialogs.dart';
import 'package:movies/ui/shared/page_route.dart';

class ProfileMainScreen extends StatelessWidget {
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return user == null
        ? Center(child: NoUserItem())
        : Center(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/man.png",
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${user!.email}",
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      //<-- SEE HERE
                                      return Theme.of(context)
                                          .primaryColor; // Defer to the widget's default.
                                    },
                                  ),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: BorderSide.none))),
                              onPressed: () async {
                                FirebaseAuth.instance.signOut();
                                // ignore: use_build_context_synchronously
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageRouteUtils.createRoute(
                                        const SplashScreen(), 0.0, 1.0),
                                    (route) => false);
                              },
                              child: const Text("Logout")),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      //<-- SEE HERE
                                      return Theme.of(context)
                                          .primaryColor; // Defer to the widget's default.
                                    },
                                  ),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: BorderSide.none))),
                              onPressed: () async {
                                DialogUtils.showBottomSheet(
                                    context, ChangePasswordScreen());
                                // // ignore: use_build_context_synchronously
                                // Navigator.pushNamedAndRemoveUntil(
                                //     context, SplashScreen.routeName, (route) => false);
                              },
                              child: const Text("Forget Password")),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
