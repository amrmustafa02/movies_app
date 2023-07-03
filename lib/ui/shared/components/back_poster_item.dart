import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/constants/api_data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'glass_item.dart';

// ignore: must_be_immutable
class BackPosterItem extends StatefulWidget {
  String imageUrl;
  String movieName;

  BackPosterItem({required this.imageUrl, required this.movieName, super.key});

  @override
  State<BackPosterItem> createState() => _BackPosterItemState();
}

class _BackPosterItemState extends State<BackPosterItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
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
                imageUrl: ApiData.basePosterUrl + widget.imageUrl,
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
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.4),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Text(
            widget.movieName,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        // Center(
        //   child: InkWell(
        //     onTap: () {
        //
        //     },
        //     child: GlassItem(
        //       theChild: Icon(
        //         Icons.play_arrow,
        //         color: Theme.of(context).primaryColor,
        //       ),
        //       theHeight: 50.0,
        //       theWidth: 50.0,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
