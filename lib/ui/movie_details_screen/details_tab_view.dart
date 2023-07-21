import 'package:flutter/material.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/model/api_model/movies_details/ImagesOfMovies.dart';
import 'package:movies/ui/components/network_image.dart';
import 'package:movies/ui/movie_details_screen/all_cast_screen/all_cast_screen.dart';
import 'package:movies/ui/movie_details_screen/all_iamges_screen.dart';
import 'package:readmore/readmore.dart';

import '../../model/api_model/movies_details/Cast.dart';
import '../../model/api_model/movies_details/Crew.dart';
import 'cast_item.dart';

// ignore: must_be_immutable
class DetailsTabView extends StatefulWidget {
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
  State<DetailsTabView> createState() => _DetailsTabViewState();
}

class _DetailsTabViewState extends State<DetailsTabView>
    with AutomaticKeepAliveClientMixin<DetailsTabView> {
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
              widget.overView,
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
                          return AllCastScreen(
                              crew: widget.crews, casts: widget.casts);
                        },
                      ));
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    )),
              ],
            ),
            widget.casts.isNotEmpty
                ? CastItem(
                    imageUri: widget.casts[0].profilePath,
                    castModel: widget.casts[0])
                : Container(),
            widget.casts.length > 1
                ? CastItem(
                    imageUri: widget.casts[1].profilePath,
                    castModel: widget.casts[1])
                : Container(),
            widget.casts.length > 2
                ? CastItem(
                    imageUri: widget.casts[2].profilePath,
                    castModel: widget.casts[2])
                : Container(),
            widget.casts.length > 3
                ? CastItem(
                    imageUri: widget.casts[3].profilePath,
                    castModel: widget.casts[3])
                : Container(),
            widget.casts.length > 4
                ? CastItem(
                    imageUri: widget.casts[4].profilePath,
                    castModel: widget.casts[4])
                : Container(),
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
                          return AllImagesScreen(imagesOfMovies: widget.imagesOfMovies);
                        },
                      ));
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    )),
              ],
            ),
            SizedBox(
                height: 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.imagesOfMovies.backdrops!.length > 20
                      ? 20
                      : widget.imagesOfMovies.backdrops!.length,
                  itemBuilder: (context, index) {
                    return MyNetworkImage(
                      imageUrl: ApiData.largeImageSizeUri +
                          widget.imagesOfMovies.backdrops![index].filePath!,
                      width: 250,
                      height: 150,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
