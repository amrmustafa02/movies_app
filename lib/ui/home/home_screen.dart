import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/ui/home/upcoming_movies.dart';
import 'package:movies/ui/shared/components/glass_item.dart';
import 'package:movies/ui/shared/components/one_row/type_movies_row.dart';
import 'package:movies/ui/shared/text_utils.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/viewModel/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home-screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        elevation: 0,
        items:   [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,

              label: "Home",
              icon: const Icon(
                Icons.home_rounded,
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,

              label: "Explore",
              icon: Icon(Icons.explore_rounded)),
          const BottomNavigationBarItem(
              label: "Likes",
              icon: Icon(Icons.favorite_rounded)),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,

              label: "Profile",
              icon: const Icon(Icons.person_rounded)),
        ],
      ),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: BlocBuilder<HomeViewModel, HomeState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SuccessState) {
              print(state.movies.length);
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils.showText("Upcoming", 30),
                    const SizedBox(
                      height: 12,
                    ),
                    UpComingMovies(
                      movies: state.upcomingMovies,),
                    TypeOfMovies(
                      movies: state.movies,
                    ),
                    TypeOfMovies(
                      movies: state.movies,
                    ),
                    // Column(
                    //   children: [
                    //     Expanded(
                    //         child: TypeOfMovies(
                    //       movies: state.movies,
                    //     )),
                    //   ],
                    // ),
                    // Column(
                    //   children: [
                    //     Expanded(
                    //         child: TypeOfMovies(
                    //       movies: state.movies,
                    //     )),
                    //   ],
                    // ),
                  ],
                ),
              );

              // return
            }
            return const SizedBox(
              height: 200,
            );
          },
          bloc: viewModel,
        ),
      ),
    );
  }
}
