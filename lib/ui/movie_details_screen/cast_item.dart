import 'package:flutter/material.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/ui/components/network_image.dart';

import '../../model/api_model/movies_details/Cast.dart';

// ignore: must_be_immutable
class CastItem extends StatelessWidget {
  String imageUri;
  Cast castModel;
  bool putIcon;
  double width;
  double height;
  int fontSize;

  CastItem({super.key,
    this.putIcon = true,
    this.width = 70,
    this.height = 75,
    this.fontSize=16,
    required this.castModel,
    required this.imageUri});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [




          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: MyNetworkImage(
              imageUrl: ApiData.midImageSizeUrl + (castModel.profilePath ?? ""),
              width: width,
              height: height,
            ),
          ),

          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                castModel.name ?? "No name found!!",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),

              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  castModel.character ?? "No name found!!",
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              )
            ],
          ),

          const Spacer(),


                IconButton(
              onPressed: () {},
              icon: Icon(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  Icons.more_horiz_rounded))

        ],
      ),
    );
  }

}
