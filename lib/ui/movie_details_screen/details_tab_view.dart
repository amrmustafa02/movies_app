import 'package:flutter/material.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/model/api_model/movies_details/ImagesOfMovies.dart';
import 'package:movies/ui/components/network_image.dart';
import 'package:movies/ui/movie_details_screen/all_cast_screen/all_cast_screen.dart';
import 'package:readmore/readmore.dart';

import '../../model/api_model/movies_details/Cast.dart';
import '../../model/api_model/movies_details/Crew.dart';
import 'cast_item.dart';

// ignore: must_be_immutable
class DetailsTabView extends StatelessWidget {
  ImagesOfMovies imagesOfMovies;
  String overView;
  List<Cast> casts;
  List<Crew> crews;

  DetailsTabView(
      {super.key,
      required this.imagesOfMovies,
      required this.crews,
      required this.overView,
      required this.casts});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Overview",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(
              height: 5,
            ),
            ReadMoreText(
              overView,
              postDataTextStyle:
                  const TextStyle(fontSize: 16, color: Colors.grey),
              preDataTextStyle:
                  const TextStyle(fontSize: 16, color: Colors.grey),
              trimLines: 3,
              colorClickableText: Colors.red,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'More',
              trimExpandedText: 'Less',
              moreStyle: TextStyle(
                  fontSize: 16, color: Theme.of(context).primaryColor),
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Cast & Crew",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AllCastScreen(crew: crews, casts: casts);
                        },
                      ));
                    },
                    child: const Text(
                      "View all",
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),
            CastItem(imageUri: casts[0].profilePath!, castModel: casts[0]),
            CastItem(imageUri: casts[1].profilePath!, castModel: casts[1]),
            CastItem(imageUri: casts[2].profilePath!, castModel: casts[2]),
            CastItem(imageUri: casts[3].profilePath!, castModel: casts[3]),
            CastItem(imageUri: casts[4].profilePath!, castModel: casts[4]),

            Row(
              children: [
                const Text(
                  "Images",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AllCastScreen(crew: crews, casts: casts);
                        },
                      ));
                    },
                    child: const Text(
                      "View all",
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),

            SizedBox(
                height: 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesOfMovies.backdrops!.length,
                  itemBuilder: (context, index) {
                    return MyNetworkImage(
                      imageUrl: ApiData.largeImageSizeUri +
                          imagesOfMovies.backdrops![index].filePath!,
                      width: 250,
                      height: 150,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                )),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
