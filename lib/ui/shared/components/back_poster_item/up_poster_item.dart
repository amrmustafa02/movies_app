import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/api_model/movie_item_model.dart';

import '../../../../constants/api_data.dart';

class UpBaseItem extends StatelessWidget {
  MovieItemModel movieItemModel;
  UpBaseItem({required this.movieItemModel});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: 100,
              height: 150,
              fit: BoxFit.fill,
              imageUrl: ApiData.baseImageUrl + movieItemModel.posterPath!,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Expanded(
          child: Text(
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            movieItemModel.overview!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
