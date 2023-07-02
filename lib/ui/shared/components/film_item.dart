import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/ui/shared/components/glass_item.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../model/api_model/movie_item_model.dart';

// ignore: must_be_immutable
class MovieItem extends StatefulWidget {
  MovieItem({required this.movieItemModel, super.key});

  MovieItemModel movieItemModel;

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  bool scroll = false;
  int speedFactor = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  width: 150,
                  height: 200,
                  fit: BoxFit.fill,
                  imageUrl:
                      "${ApiData.baseImageUrl}${widget.movieItemModel.posterPath}",
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.withOpacity(1.0),
                        Colors.black.withOpacity(1.0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
              ),
            ],
          ),

          //--------------------------------------
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                maxLines: 1,
                "${widget.movieItemModel.title!} (${(widget.movieItemModel.releaseDate).toString().substring(0, 4)})",
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          //-----------------------------------------

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  // Text(
                  //   (movieItemModel.releaseDate).toString().substring(0, 4),
                  //   style: const TextStyle(
                  //       color: Colors.white, fontWeight: FontWeight.w300),
                  // ),
                  // const Spacer(),
                  // const Icon(
                  //   Icons.star,
                  //   color: Colors.yellow,
                  //   size: 15,
                  // ),
                  // const SizedBox(
                  //   width: 5,
                  // ),


              RatingBar.builder(

                itemSize: 10,
                minRating: (widget.movieItemModel.voteAverage + 0.0) / 2.0,
                maxRating: (widget.movieItemModel.voteAverage + 0.0) / 2.0,
                initialRating: (widget.movieItemModel.voteAverage + 0.0) / 2.0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rate_rounded,
                  size: 10,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),

              Text(
                (widget.movieItemModel.voteAverage + 0.0)
                    .toString()
                    .substring(0, 3),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );
  }
}
