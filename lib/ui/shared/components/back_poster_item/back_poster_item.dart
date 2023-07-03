import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/ui/shared/components/back_poster_item/up_poster_item.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../glass_item.dart';
import '../icon_play_video.dart';

// ignore: must_be_immutable
class BackPosterItem extends StatefulWidget {
  MovieItemModel movieItemModel;

  BackPosterItem({required this.movieItemModel, super.key});

  @override
  State<BackPosterItem> createState() => _BackPosterItemState();
}

class _BackPosterItemState extends State<BackPosterItem> {
  late Widget iconBody;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.fill,
                imageUrl:
                    ApiData.basePosterUrl + widget.movieItemModel.backdropPath!,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      // Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                      // Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.4),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
            ),
          ],
        ),
        // UpBaseItem(
        //   movieItemModel: widget.movieItemModel,
        // ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Text(
            widget.movieItemModel.title!,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),

        // IconPlayVideo(),
      ],
    );
  }
}
