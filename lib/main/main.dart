import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies/ui/main_screen.dart';
import 'package:movies/main/my_theme.dart';
import 'package:movies/main/splash_screen.dart';

import '../ui/search_screen/main_screen.dart';

void main() {
  // runApp(
  //    DevicePreview(
  //     enabled: true,
  //     tools: const [
  //       ...DevicePreview.defaultTools
  //     ],
  //     builder: (context) => const MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: MyTheme.myTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
