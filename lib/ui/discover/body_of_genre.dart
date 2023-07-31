import 'package:flutter/material.dart';
import 'package:movies/controllers/api/api_discover_manager.dart';
import 'package:movies/ui/shared/page_route.dart';

import '../../constants/api_data.dart';
import '../../model/api_model/GenreModel.dart';
import '../../model/api_model/movie_item_model.dart';
import '../components/network_image.dart';
import '../movie_details_screen/main_screen.dart';

class BodyOfGenre extends StatefulWidget {
  GenreModel genre;
  List<MovieItemModel> movieItemModels;

  BodyOfGenre({required this.genre, required this.movieItemModels});

  @override
  State<BodyOfGenre> createState() => _BodyOfGenreState();
}

class _BodyOfGenreState extends State<BodyOfGenre> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification.metrics.pixels ==
            scrollNotification.metrics.maxScrollExtent) {
          loadMore();
          setState(() {});
        }
        return false;
      },
      child: GridView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteUtils.createRoute(
                        MovieDetailsMainScreen(
                            movieId: widget.movieItemModels[index].id),
                        1.0,
                        0.0));
              },
              child: MyNetworkImage(
                  imageUrl: ApiData.midImageSizeUrl +
                      widget.movieItemModels[index].posterPath!,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width + 50),
            ),
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: widget.movieItemModels.length,
      ),
    );
  }

  loadMore() async {
    page++;
    var newMovies = await ApiDiscoverManager.getDiscoverResult(
        "${widget.genre.id!}",
        page: page);
    widget.movieItemModels.addAll(newMovies);
    setState(() {});
  }
}
