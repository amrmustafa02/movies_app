import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api/api_movie_manager.dart';
import 'package:movies/ui/components/movie_item.dart';
import 'package:movies/ui/components/network_image.dart';

import '../../../model/api_model/movie_item_model.dart';
import '../../movie_details_screen/main_screen.dart';
import '../../shared/page_route.dart';

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
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification.metrics.pixels ==
            scrollNotification.metrics.maxScrollExtent) {
          refresh();
          setState(() {});
        }
        return false;
      },
      child: Scaffold(
          // floatingActionButton: FloatingActionButton(
          //     onPressed: () {
          //       refresh();
          //     },
          //     backgroundColor: Theme
          //         .of(context)
          //         .primaryColor,
          //     child: iconLoad),
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
          )),
    );
  }

  getBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteUtils.createRoute(
                          MovieDetailsMainScreen(
                              movieId: widget.movies[index].id),
                          1.0,
                          0.0));
                },
                child: MyNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    imageUrl: ApiData.midImageSizeUrl +
                        (widget.movies[index].posterPath ?? ""),
                    height: MediaQuery.of(context).size.width),
              ),
            );
          },
        );
      },
    );
  }

  refresh() async {
    setState(() {});

    await loadMoreItems();
    await Future.delayed(const Duration(seconds: 1));

    setState(() {});
  }

  Future<void> loadMoreItems() async {
    widget.page++;

    List<MovieItemModel> moreMovies = await ApiMovieManager.getMoviesByType(
        widget.apiType,
        page: widget.page);
    widget.movies.addAll(moreMovies);
  }
}
