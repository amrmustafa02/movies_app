import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/constants/api_data.dart';

import '../glass_item.dart';

class BackPosterItem extends StatelessWidget {
  String imageUrl;
  String movieName;

  BackPosterItem({required this.imageUrl, required this.movieName, super.key});

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
                imageUrl: ApiData.baseImageUrl+imageUrl,
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
                      Colors.black.withOpacity(1.0),
                      Colors.black.withOpacity(0.2),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child:  Text(
            movieName,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
         Center(
          child: GlassItem(
            theChild: Icon(
              Icons.play_arrow_outlined,
              color: Theme.of(context).primaryColor,
            ),
            theHeight: 50.0,
            theWidth: 50.0,
          ),
        ),
      ],
    );
  }
}
