import 'package:flutter/material.dart';

import 'movies/movie_screen/home_movie_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "main-screen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  int currentBottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Moviecoo"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            currentBottomIndex = value;
            setState(() {});
          },
          elevation: 0,
          currentIndex: currentBottomIndex,
          backgroundColor: Colors.transparent,
          selectedItemColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedLabelStyle: const TextStyle(color: Colors.orange),
          unselectedIconTheme:
              const IconThemeData(size: 24, color: Colors.white),
          items: [
            BottomNavigationBarItem(
              label: "Movies",
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              // icon: const Icon(Icons.movie_rounded)
              icon: const ImageIcon(AssetImage("assets/images/movies.png")),
            ),
            //assets/images/tv-show.png
            BottomNavigationBarItem(
                label: "TV Shows",
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: const ImageIcon(AssetImage("assets/images/tv-show.png"))),
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
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SafeArea(top: true, child: HomeMovieScreen()),
        ));
  }
}
