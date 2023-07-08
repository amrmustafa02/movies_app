import 'package:flutter/material.dart';
import 'package:movies/ui/home/all_movies_test.dart';
import 'package:movies/ui/main_screen.dart';
import 'package:movies/main/my_theme.dart';
import 'package:movies/main/splash_screen.dart';

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
        SplashScreen.routeName: (context) => const SplashScreen(),
        MainScreen.routeName: (context) => MainScreen(),
        TestScreen.routeName: (context) => TestScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
