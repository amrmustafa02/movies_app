import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/api_model/movie_item_model.dart';

import '../../../constants/api_data.dart';

class ViewAllMovieItem extends StatelessWidget{
  MovieItemModel movieItemModel;
  ViewAllMovieItem({required this.movieItemModel});
  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      height: 500,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:
              "${ApiData.midImageSizeUrl}${movieItemModel.posterPath}",
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 1,
            height: 5,
          ),

          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              "${movieItemModel.title!} (${(movieItemModel.releaseDate).toString().substring(0, 4)})",
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