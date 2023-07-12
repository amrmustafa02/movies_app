import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';
import 'package:movies/ui/movie_details_screen/tab_bar.dart';
import '../../constants/api_data.dart';
import '../../model/api_model/movies_details/ReviewModel.dart';
import '../components/network_image.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsModel movieDetailsModel;
  ReviewModel reviewItem;
  MovieDetailsScreen({required this.movieDetailsModel, required this.reviewItem,super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 125),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          // MyNetworkImage(imageUrl: ApiData.largeImageSizeUri+state.movieDetailsModel!.backdropPath!, width:MediaQuery.of(context).size.width, height: 300,),
                          CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            fit: BoxFit.fill,
                            imageUrl: ApiData.largeImageSizeUri +
                                movieDetailsModel.backdropPath!,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.black.withOpacity(0.4),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Theme.of(context).primaryColor,
                            )),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border_outlined,
                              color: Theme.of(context).primaryColor,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              MyNetworkImage(
                  imageUrl:
                      ApiData.midImageSizeUrl + movieDetailsModel.posterPath!,
                  width: 180,
                  height: 250),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              textAlign: TextAlign.center,
              movieDetailsModel.title!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getRunTimeByHour(movieDetailsModel.runtime!),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: VerticalDivider(
                    width: 1,
                    color: Theme.of(context).primaryColor,
                    thickness: 1,
                  ),
                ),
                Text(
                  getReleaseDate(movieDetailsModel.releaseDate!),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.symmetric(horizontal: 4),
            height: 30,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                getGenres(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar(
                ignoreGestures: true,
                // <---- add this
                initialRating: movieDetailsModel.voteAverage!.toDouble() / 2.0,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amberAccent,
                  ),
                  half: const Icon(
                    Icons.star_half_rounded,
                    color: Colors.amberAccent,
                  ),
                  empty: const Icon(
                    Icons.star_outline_rounded,
                    color: Colors.amberAccent,
                  ),
                ),
                onRatingUpdate: (value) {},
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: MovieDetailsTabBar(
                movieDetailsModel: movieDetailsModel, reviewModel: reviewItem,
              )),
        ],
      ),
    );
  }

  getRunTimeByHour(num runTime) {
    var hours = runTime ~/ 60;
    var min = runTime - (hours * 60);
    return "${hours}h ${min}m";
  }

  getGenres() {
    var genres = movieDetailsModel.genres!;
    String result = "";
    for (int i = 0; i < genres.length - 1; i++) {
      result += "${genres[i].name!}, ";
    }
    if (genres.isNotEmpty) {
      result += genres[genres.length - 1].name!;
    }

    return result;
  }

  getReleaseDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('MMM d, yyyy').format(dateTime);
  }

}
