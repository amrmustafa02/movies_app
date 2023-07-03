import 'package:flutter/material.dart';
import 'package:movies/ui/home/all_movies_screen.dart';
import 'package:movies/ui/home/main_screen.dart';
import 'package:movies/main/my_theme.dart';
import 'package:movies/main/splash_screen.dart';

import '../ui/home/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.myTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName: (context) => Home(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        MainScreen.routeName: (context) => MainScreen(),
      },
      initialRoute: MainScreen.routeName,
    );
  }
}
