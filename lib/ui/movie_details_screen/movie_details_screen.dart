import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';

import '../../constants/api_data.dart';
import '../components/network_image.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsModel movieDetailsModel;

  MovieDetailsScreen({required this.movieDetailsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 125),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8)
                ),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 0,sigmaY: 0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // MyNetworkImage(imageUrl: ApiData.largeImageSizeUri+state.movieDetailsModel!.backdropPath!, width:MediaQuery.of(context).size.width, height: 300,),
                      CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        fit: BoxFit.fill,
                        imageUrl:
                            ApiData.largeImageSizeUri + movieDetailsModel.backdropPath!,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withOpacity(0.4),
                                Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withOpacity(0.2),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MyNetworkImage(
                imageUrl:
                ApiData.midImageSizeUrl + movieDetailsModel.posterPath!,
                width: 170,
                height: 250),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      movieDetailsModel.title!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
