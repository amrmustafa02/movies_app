import 'package:flutter/material.dart';
import 'package:movies/controllers/api/api_manager.dart';
import 'package:movies/ui/home/home_screen.dart';
import 'package:movies/ui/home/test.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "splash-screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
         ApiManager.getPopularFilms();
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/splash_screen.png")),
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
