import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/ui/movie_details_screen/main_screen.dart';

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
          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: widget.movieItemModel.id),));
            },
            child: ClipRRect(
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
              "${widget.movieItemModel.title!} (${(widget.movieItemModel.releaseDate).toString().substring(0, 4)})",
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
          //-----------------------------------------
        ],
      ),
    );
  }
}
