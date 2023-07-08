import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
            child: LoadingAnimationWidget.dotsTriangle(
          color: Theme.of(context).primaryColor, size: 20,
        )),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
