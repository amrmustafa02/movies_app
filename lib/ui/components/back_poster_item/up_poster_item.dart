import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/api_model/movie_item_model.dart';

import '../../../../constants/api_data.dart';
import '../../movie_details_screen/main_screen.dart';
import '../network_image.dart';

class UpBaseItem extends StatelessWidget {
  MovieItemModel movieItemModel;

  UpBaseItem({required this.movieItemModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: MyNetworkImage(
            imageUrl: ApiData.midImageSizeUrl + movieItemModel.posterPath!,
            width: 100,
            height: 150,
          ),

          // child: ClipRRect(
          //   borderRadius: BorderRadius.circular(10),
          //   child: CachedNetworkImage(
          //     width: 100,
          //     height: 150,
          //     fit: BoxFit.fill,
          //     imageUrl: ,
          //     placeholder: (context, url) =>
          //         const Center(child: CircularProgressIndicator()),
          //     errorWidget: (context, url, error) => const Icon(Icons.error),
          //   ),
          // ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                movieItemModel.title!,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),

              IntrinsicHeight(
                child: Row(
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      movieItemModel.releaseDate!.substring(0, 4),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const VerticalDivider(color: Colors.white, thickness: 1),
                    const Icon(
                      Icons.star_outlined,
                      color: Colors.amberAccent,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      movieItemModel.voteAverage!.toString().substring(0, 3),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      alignment: Alignment.center,
                      width: 50,
                      height: 15,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "TMDB",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Container(
              //   alignment: Alignment.center,
              //   width: 60,
              //   height: 20,
              //   decoration: BoxDecoration(
              //     color: Colors.blueAccent,
              //    borderRadius: BorderRadius.circular(8)
              //   ),
              //   child: Text("TMDB",style: TextStyle(
              //     color: Colors.white,fontSize: 12
              //   ),),
              // ),

              SizedBox(
                width: 100,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsMainScreen(
                              movieId: movieItemModel.id),
                        ));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                  child: const Text(
                    "Read More",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
