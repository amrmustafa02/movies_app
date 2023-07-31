import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/model/api/api_movie_manager.dart';
import 'package:movies/ui/components/movie_item.dart';

import '../../../model/api_model/movie_item_model.dart';

// ignore: must_be_immutable
class AllMoviesScreen extends StatefulWidget {
  static const String routeName = "all-screen-movie";
  String apiType;
  String type;
  int page = 1;
  List<MovieItemModel> movies;
  late List<Widget> moviesWidget;

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
    widget.movies = [];
    super.dispose();
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
              Navigator.pop(context);
            },
          ),
          title: Text(widget.type),
        ),
        body: SafeArea(
          child: getBody(),
        ));
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
              childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            return MovieItem(movieItemModel: widget.movies[index]);
          },
        );
      },
    );
  }

  refresh() async {
    iconLoad =
        LoadingAnimationWidget.halfTriangleDot(color: Colors.white, size: 25);
    setState(() {});

    await loadMoreItems();
    await Future.delayed(const Duration(seconds: 1));
    iconLoad = const Icon(Icons.refresh_rounded);
    setState(() {});
  }

  Future<void> loadMoreItems() async {
    widget.page++;

    List<MovieItemModel> moreMovies =
        await ApiMovieManager.getMoviesByType(widget.apiType, page: widget.page);
    widget.movies.addAll(moreMovies);
  }
}
