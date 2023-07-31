import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/cast_details/CastDetailsModel.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/ui/cast_deatails_screen/main_screen.dart';
import 'package:movies/ui/components/network_image.dart';
import 'package:movies/ui/shared/text_utils.dart';

import '../movie_details_screen/main_screen.dart';

class CastLikeItem extends StatelessWidget {
  CastDetailsModel castItemModel;

  CastLikeItem({required this.castItemModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthPoster = size.width * 0.45;
    var heightPoster = size.width * 0.45 + 70;
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          castItemModel.profilePath != null
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CastDetailsMainScreen(castItemModel.id!.toInt()),
                        ));
                  },
                  child: MyNetworkImage(
                      imageUrl:
                          ApiData.midImageSizeUrl + castItemModel.profilePath!,
                      width: widthPoster,
                      height: heightPoster),
                )
              : MyNetworkImage(
                  imageUrl: "assets/images/no-photo",
                  width: widthPoster,
                  height: heightPoster),
          const SizedBox(width: 10),
          SizedBox(
            height: heightPoster,
            width: size.width - widthPoster - 26,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: Text(
                    castItemModel.name ?? "No Name Found",
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage("assets/images/date_of_birth.png"),
                      size: 17,
                      color: Colors.blueGrey,
                      // color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      castItemModel.birthday ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.8)),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage("assets/images/location.png"),
                      size: 17,
                      color: Colors.blueGrey,
                      // color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        castItemModel.placeOfBirth ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 14, color: Colors.white.withOpacity(0.8)),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      castItemModel.biography ?? "No Title Found",
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
