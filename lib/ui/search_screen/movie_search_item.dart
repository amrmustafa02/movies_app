import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/ui/components/network_image.dart';
import 'package:movies/ui/shared/page_route.dart';
import 'package:movies/ui/shared/text_utils.dart';

import '../movie_details_screen/main_screen.dart';

class MovieSearchItem extends StatelessWidget {
  MovieItemModel movieItemModel;

  MovieSearchItem({required this.movieItemModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthPoster = size.width * 0.45;
    var heightPoster = size.width * 0.45 + 70;
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          movieItemModel.posterPath != null
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteUtils.createRoute(
                            MovieDetailsMainScreen(movieId: movieItemModel.id),
                            1.0,
                            0.0));
                  },
                  child: MyNetworkImage(
                      imageUrl:
                          ApiData.midImageSizeUrl + movieItemModel.posterPath!,
                      width: widthPoster,
                      height: heightPoster),
                )
              : MyNetworkImage(
                  imageUrl: "assets/images/no-photo",
                  width: widthPoster,
                  height: heightPoster),
          const SizedBox(width: 10),
          SizedBox(
            height: heightPoster,
            width: size.width - widthPoster - 26,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: Text(
                    movieItemModel.originalTitle ?? "No Title Found",
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      movieItemModel.voteAverage!.toString().substring(0, 3),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RatingBar(
                      allowHalfRating: true,
                      itemCount: 5,
                      ignoreGestures: true,
                      initialRating: movieItemModel.voteAverage!.toDouble() / 2,
                      itemSize: 25,
                      ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.yellow,
                          ),
                          half: const Icon(Icons.star_half_rounded,
                              color: Colors.yellow),
                          empty: const Icon(Icons.star_border_rounded,
                              color: Colors.yellow)),
                      onRatingUpdate: (value) {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage("assets/images/calendar(2).png"),
                      size: 17,
                      color: Colors.blueGrey,
                      // color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings

                      TextUtils.getReleaseDate(
                          movieItemModel.releaseDate ?? ""),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.8)),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      movieItemModel.overview ?? "No Title Found",
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
