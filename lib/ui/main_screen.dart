import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'home/movie_screen/home_movie_screen.dart';
class MainScreen extends StatefulWidget {
  static const routeName = "main-screen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  int currentBottomIndex =0;



  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Moviecoo"),
          actions: [
            Container(
              child: AnimSearchBar(width: MediaQuery.of(context).size.width,
                rtl: true,
                searchIconColor: Theme.of(context).primaryColor,
                color: Colors.grey.withOpacity(0.0),
                textController:TextEditingController(), onSuffixTap:(){} , onSubmitted:(p0) {

                },),
            ),
          ],
        ),
          bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            currentBottomIndex = value;
            setState(() {

            });
          },
          elevation: 0,

          currentIndex: currentBottomIndex,
          backgroundColor: Colors.transparent,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedIconTheme: const IconThemeData(
            size: 20
          ),
          items:  [
          BottomNavigationBarItem(label: "Movies", backgroundColor: Theme.of(context).scaffoldBackgroundColor,icon: const Icon(Icons.movie_rounded)),
          BottomNavigationBarItem(label: "TV Shows", backgroundColor: Theme.of(context).scaffoldBackgroundColor, icon: const Icon(Icons.tv_rounded)),
          BottomNavigationBarItem(label: "Likes", backgroundColor: Theme.of(context).scaffoldBackgroundColor, icon: const Icon(Icons.favorite_rounded)),
          BottomNavigationBarItem(label: "Profile", backgroundColor: Theme.of(context).scaffoldBackgroundColor, icon: const Icon(Icons.person_rounded)),
        ],),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SafeArea(
              top: true,
              child: HomeMovieScreen()),
        )
      );

  }

}
