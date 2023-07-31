import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/ui/components/network_image.dart';
import 'package:movies/ui/shared/page_route.dart';

import '../../../model/api_model/movie_item_model.dart';
import '../../movie_details_screen/main_screen.dart';

// ignore: must_be_immutable
class MoviesSwaps extends StatefulWidget {
  List<MovieItemModel> movies;

  MoviesSwaps({super.key, required this.movies});

  @override
  State<MoviesSwaps> createState() => _MoviesSwapsState();
}

class _MoviesSwapsState extends State<MoviesSwaps>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.54,
      child: Swiper(
        itemCount: widget.movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.78,
        itemHeight: size.height * 0.54,
        itemBuilder: (_, index) {
          final movie = widget.movies[index];

          return InkWell(
            onTap: () {

              Navigator.push(
                  context,PageRouteUtils.createRoute(MovieDetailsMainScreen(
                  movieId: widget.movies[index].id), 1.0,0.0));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MyNetworkImage(
                  imageUrl: (ApiData.largeImageSizeUri + movie.posterPath!),
                  width: double.infinity,
                  height: size.height * 0.54,
                )),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
