import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/controllers/viewModel/likes_provider.dart';
import 'package:movies/ui/login_signup_screen/login_screen.dart';
import 'package:movies/ui/main_screen.dart';
import 'package:movies/my_theme.dart';
import 'package:movies/ui/splash_screen.dart';
import 'package:provider/provider.dart';

import 'model/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => LikesProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            child: child!);
      },
      initialRoute:  SplashScreen.routeName,
      theme: MyTheme.myTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
      },
      // initialRoute: SplashScreen.routeName,
    );
  }
}
