import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:movies/my_theme.dart';
import 'package:movies/ui/profile_screen/main_screen.dart';
import 'package:movies/ui/search_screen/search_bar_item.dart';

import 'discover/main_screen.dart';
import 'home/movie_screen/home_movie_screen.dart';
import 'likes_screen/main_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "main-screen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0;
  int currentBottomIndex = 0;
  List<Widget> bottomNavigationBarScreens = [
    const HomeMovieScreen(),
    DiscoverMainScreen(),
    LikesMainScreen(),
    ProfileMainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BottomBar(
          barColor:Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
          // barColor: Color(0xFF205375).withOpacity(0.5),
            borderRadius: BorderRadius.circular(500),
            hideOnScroll: true,
            scrollOpposite: false,
            child: BottomNavigationBar(
              onTap: (value) {
                currentBottomIndex = value;
                setState(() {});
              },

              elevation: 0,
              currentIndex: currentBottomIndex,
              backgroundColor: Colors.transparent,
              // backgroundColor: Color(0xFF243554).withOpacity(0.4),
              selectedItemColor: Theme.of(context).primaryColor,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.white,
              selectedIconTheme: const IconThemeData(size: 24),
              unselectedLabelStyle: const TextStyle(color: Colors.orange),
              unselectedIconTheme:
              const IconThemeData(size: 22, color: Colors.white),
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  // icon: const Icon(Icons.movie_rounded)
                  icon: const ImageIcon(AssetImage("assets/images/home.png")),
                ),
                //assets/images/tv-show.png
                BottomNavigationBarItem(
                    label: "Discover",
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    icon:
                    const ImageIcon(AssetImage("assets/images/discover.png"))),
                BottomNavigationBarItem(
                    label: "Likes",
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    // assets/images/profile.png
                    icon: const ImageIcon(AssetImage("assets/images/love.png"))),
                BottomNavigationBarItem(
                    label: "Profile",
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    icon: const ImageIcon(AssetImage("assets/images/profile.png"))),
              ],
            ),
            body: (context, controller) =>
                SafeArea(
                    child: IndexedStack(
                      index: currentBottomIndex,
                      children: bottomNavigationBarScreens,
                    ))),
      );


  }

  @override
  bool get wantKeepAlive => true;
}
