import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/controllers/remember_me_ctrl.dart';
import 'package:movies/ui/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "splash-screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        var state = await RememberMeCtrl.getRememberMeState();
        if (state == false || state == null) {
          await FirebaseAuth.instance.signOut();
        }

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, MainScreen.routeName);
      },
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/main_splash.png")),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Moviecoo",
                style: TextStyle(
                    fontFamily: 'Romanesco', color: Colors.white, fontSize: 70),
              )
            ],
          ),
        ),
      ),
    );
  }
}
