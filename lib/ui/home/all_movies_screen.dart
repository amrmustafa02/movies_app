import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/controllers/api/api_manager.dart';
import 'package:movies/ui/shared/components/movie_item.dart';

import '../../model/api_model/movie_item_model.dart';
import '../shared/components/view_all_movie_item.dart';

// ignore: must_be_immutable
class AllMoviesScreen extends StatefulWidget {
  static const String routeName = "all-screen-movie";
  String apiType;
  String type;
  int page = 1;
  List<MovieItemModel> movies;
  List<Widget> moviesWidget = [];

  AllMoviesScreen(
      {super.key,
      required this.type,
      required this.apiType,
      required this.movies});

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  Widget iconLoad = const Icon(Icons.refresh_rounded);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.movies = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              refresh();
            },
            backgroundColor: Theme.of(context).primaryColor,
            child: iconLoad),
        appBar: AppBar(
          leading: TextButton(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(widget.type),
        ),
        body: getBody());
  }

  getBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth < 250 ? 1 : 2,
            childAspectRatio: 0.6
              ),
          itemBuilder: (context, index) {
            return MovieItem(movieItemModel: widget.movies[index]);
          },
        );
      },
    );
  }

  convertModelToWidget() {
    int len = widget.movies.length;
    if (len % 2 == 0) {
      for (int i = 0; i < widget.movies.length; i++) {
        // widget.moviesWidget.add(null);
      }
    }
  }

  refresh() async {
    iconLoad =
        LoadingAnimationWidget.dotsTriangle(color: Colors.white, size: 25);
    setState(() {});

    await loadMoreItems();
    await Future.delayed(Duration(seconds: 1));
    iconLoad = const Icon(Icons.refresh_rounded);
    setState(() {});
  }

  Future<void> loadMoreItems() async {
    widget.page++;
    print("-====================-page");
    List<MovieItemModel> moreMovies =
        await ApiManager.getMoviesByType(widget.apiType, page: widget.page);
    widget.movies.addAll(moreMovies);
  }
}
