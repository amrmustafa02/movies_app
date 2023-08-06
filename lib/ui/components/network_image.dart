import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyNetworkImage extends StatelessWidget {
  String imageUrl;
  double width;
  double height;

  MyNetworkImage(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: BoxFit.fill,
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(
          child:  Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Theme.of(context).primaryColor.withOpacity(0.4),
              child: Container(
                color: Colors.grey.withOpacity(0.5),
                height: height,
                width: width,
              )),
        ),
        errorWidget: (context, url, error) => const ImageIcon(
          AssetImage("assets/images/no-photo.png"),
          color: Colors.black,
        ),
      ),
    );
  }
}
