import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/ui/search_screen/movie_search_item.dart';
import 'package:movies/ui/search_screen/search_results.dart';

import '../../model/api/api_discover_manager.dart';
import '../components/no_results_found.dart';

class SearchScreen extends SearchDelegate {
  List<MovieItemModel> searchResult = [];
  static String routeName = "search_screen";

  @override
  String get searchFieldLabel => 'Enter movie name';

  @override
  TextStyle? get searchFieldStyle =>
      const TextStyle(color: Colors.white, fontSize:16);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Theme.of(context).primaryColor,
      canvasColor: Theme.of(context).scaffoldBackgroundColor, // Change this
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
        counterStyle: const TextStyle(color: Colors.white),
        fillColor: Colors.blueGrey,
      ),
      appBarTheme: AppBarTheme(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        elevation: 0,
        color: const Color(0xFF243554).withOpacity(0.3),
        //app bar color I wanted
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = "";
          Navigator.pop(context);
        },
        icon: const ImageIcon(AssetImage("assets/images/cancel.png"),size: 14,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return query != ""
        ? FutureBuilder(
            future: ApiDiscoverManager.getSearchResult(query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Theme.of(context).primaryColor,
                    size: 45,
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                if (!snapshot.hasData) {
                  return NoResultsFoundItem(message: "No Suggestion Found");
                }

                var movies = snapshot.data as List<MovieItemModel>;

                if (movies.isEmpty) {
                  return Center(
                      child:
                          NoResultsFoundItem(message: "No Suggestion Found"));
                }

                return SearchResults(
                  query: query,
                );
              }
              return Container();
            },
          )
        : const Center(
            child: Text(
              "Type something...",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query != ""
        ? FutureBuilder(
            future: ApiDiscoverManager.getSearchResult(query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Theme.of(context).primaryColor,
                    size: 45,
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (!snapshot.hasData) {
                  return NoResultsFoundItem(message: "No Suggestion Found");
                }
                var movies = snapshot.data as List<MovieItemModel>;
                if (movies.isEmpty) {
                  return Center(
                      child:
                          NoResultsFoundItem(message: "No Suggestion Found"));
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return MovieSearchItem(movieItemModel: movies[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 10,
                    );
                  },
                  itemCount: movies.length,
                );
              }
              return Container();
            },
          )
        : Container();
  }
}
