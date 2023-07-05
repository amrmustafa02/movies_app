import 'package:flutter/material.dart';
import 'package:movies/ui/main_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "splash-screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {

        Navigator.pushReplacementNamed(context, MainScreen.routeName);
      },
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/splash_screen2.png")),
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
                    fontFamily: 'Romanesco', color: Colors.white, fontSize: 96),
              )
            ],
          ),
        ),
      ),
    );
  }
}
