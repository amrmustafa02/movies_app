import 'package:flutter/material.dart';

import 'movie_screen/home_movie_screen.dart';

class TestScreen extends StatelessWidget {
  static String routeName = "Test-Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  title: Text("Application"),
                  floating: true,
                  pinned: true,
                  snap: true,
                  bottom: const TabBar(
                    tabs: <Tab>[
                      Tab(text: "T"),
                      Tab(text: "B"),
                      Tab(text: "B"),
                    ], // <-- total of 2 tabs
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                HomeMovieScreen(),
                HomeMovieScreen(),
                HomeMovieScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
