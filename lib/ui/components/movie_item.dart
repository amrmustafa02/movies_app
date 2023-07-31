import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/ui/movie_details_screen/main_screen.dart';
import 'package:movies/ui/shared/page_route.dart';

import '../../../model/api_model/movie_item_model.dart';
import 'network_image.dart';

// ignore: must_be_immutable
class MovieItem extends StatefulWidget {
  MovieItem({required this.movieItemModel});

  MovieItemModel movieItemModel;

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  bool scroll = false;
  int speedFactor = 20;
  late String year;

  @override
  void initState() {
    if (widget.movieItemModel.releaseDate != "") {
      if (widget.movieItemModel.releaseDate!.length > 3) {
        year =
            "(${widget.movieItemModel.releaseDate.toString().substring(0, 4)})";
      } else {
        year = "";
      }
    } else {
      year = "";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteUtils.createRoute(
                      MovieDetailsMainScreen(movieId: widget.movieItemModel.id),
                      1.0,
                      0.0));
            },
            child: widget.movieItemModel.posterPath != null
                ? MyNetworkImage(
                    imageUrl:
                        "${ApiData.midImageSizeUrl}${widget.movieItemModel.posterPath}",
                    width: 150,
                    height: 200,
                  )
                : Image.asset("assets/images/no-photo.png",
                    width: 150, height: 200, fit: BoxFit.fill),
          ),

          //--------------------------------------
          const SizedBox(
            width: 1,
            height: 5,
          ),

          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              "${widget.movieItemModel.title!} $year",
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
