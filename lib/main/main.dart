import 'package:flutter/material.dart';
import 'package:movies/ui/home/home_screen.dart';
import 'package:movies/main/my_theme.dart';
import 'package:movies/ui/home/splash_screen.dart';

import '../ui/home/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: MyTheme.myTheme,
      debugShowCheckedModeBanner: false,
         routes: {
           Home.routeName:(context) => Home(),
        SplashScreen.routeName:(context) => const SplashScreen(),
        HomeScreen.routeName:(context) => HomeScreen(),
         },
         initialRoute: SplashScreen.routeName,
    );
  }

}
