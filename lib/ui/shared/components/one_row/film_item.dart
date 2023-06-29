import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/constants/api_data.dart';

import '../../../../model/api_model/movie_item_model.dart';

// ignore: must_be_immutable
class MovieItem extends StatelessWidget {
  MovieItem({required this.movieItemModel, super.key});

  MovieItemModel movieItemModel;

  @override
  Widget build(BuildContext context) {
    print("========${movieItemModel.title}==");

    return Container(
      margin: const EdgeInsets.all(12),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              width: 150,
              height: 200,
              fit: BoxFit.fill,
              imageUrl: "${ApiData.baseImageUrl}${movieItemModel.posterPath}",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),

          // const SizedBox(
          //   height: 5,
          // ),
          //  Text(
          //   movieItemModel.releaseDate!.substring(0,4),
          //   style: const TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.w200,
          //     color: Colors.white,
          //   ),
          // ),

          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   movieItemModel.title!,
          //   style: const TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.w300,
          //     color: Colors.white,
          //   ),
          // ),
          const SizedBox(
            height: 5,
          ),
          Text(
            maxLines: 1,
            (movieItemModel.title!),
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  (movieItemModel.releaseDate).toString().substring(0, 4),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                Spacer(),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  (movieItemModel.voteAverage + 0.0).toString().substring(0, 3),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                // RatingBar.builder(
                //   updateOnDrag: false,
                //   tapOnlyMode: true,
                //   glow: false,
                //   itemSize: 10,
                //   minRating:( movieItemModel.voteAverage+0.0)/2.0,
                //   maxRating:( movieItemModel.voteAverage+0.0)/2.0,
                //   initialRating:( movieItemModel.voteAverage+0.0)/2.0,
                //   direction: Axis.horizontal,
                //   allowHalfRating: true,
                //   itemCount: 5,
                //   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                //   itemBuilder: (context, _) => Icon(
                //     Icons.star,
                //     size: 5,
                //     color: Colors.amber,
                //   ),
                //   onRatingUpdate: (rating) {
                //     print(rating);
                //   },
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  getTime() {}
}
