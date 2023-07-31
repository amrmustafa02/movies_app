import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/controllers/viewModel/discover_screen_view_model.dart';
import 'package:movies/ui/search_screen/search_bar_item.dart';

import 'body_of_genre.dart';
import 'discover_screen.dart';

class DiscoverMainScreen extends StatefulWidget {
  @override
  State<DiscoverMainScreen> createState() => _DiscoverMainScreenState();
}

class _DiscoverMainScreenState extends State<DiscoverMainScreen> {
  DiscoverScreenViewModel discoverScreenViewModel = DiscoverScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverScreenViewModel, DiscoverScreenState>(
      bloc: discoverScreenViewModel,
      builder: (context, state) {
        if (state is DiscoverScreenLoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Theme.of(context).primaryColor,
                size: 45,
              ),
            ),
          );
        }
        if (state is DiscoverScreenSuccessState) {
          var moviesGenre = state.movies;

          List<Tab> tabs = [];
          List<Widget> screensTabs = [];
          for (int i = 0; i < moviesGenre.length; i++) {
            var item = moviesGenre[i];
            tabs.add(Tab(
              child: Text(
                item.genre.name!,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ));
            screensTabs.add(
              BodyOfGenre(
                genre: item.genre,
                movieItemModels: item.movies,
              ),
            );
          }

          return DefaultTabController(
            length: tabs.length,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SearchBarItem(),
                Expanded(
                  child: DiscoverScreen(
                    tabs: tabs,
                    screensOfTabs: screensTabs,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  loadMoreItems(String genre, int page) async {}
}
