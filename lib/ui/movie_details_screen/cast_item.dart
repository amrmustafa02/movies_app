import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/ui/cast_deatails_screen/cast_details_screen.dart';
import 'package:movies/ui/components/network_image.dart';
import 'package:movies/ui/shared/page_route.dart';
import 'package:shimmer/shimmer.dart';

import '../../model/api_model/movies_details/Cast.dart';
import '../cast_deatails_screen/main_screen.dart';

// ignore: must_be_immutable
class CastItem extends StatefulWidget {
  String? imageUri;
  Cast castModel;
  bool putIcon;
  int id;
  double width;
  double height;
  int fontSize;

  CastItem(
      {super.key,
      this.putIcon = true,
      this.width = 70,
      this.height = 70,
      this.fontSize = 16,
      required this.castModel,
      required this.id,
      required this.imageUri});

  @override
  State<CastItem> createState() => _CastItemState();
}

class _CastItemState extends State<CastItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipOval(
            child: widget.castModel.profilePath != null
                ? MyNetworkImage(
                    imageUrl: (ApiData.midImageSizeUrl +
                        widget.castModel.profilePath!),
                    width: widget.width,
                    height: widget.height,
                  )
                : Image.asset(
                    "assets/images/user.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
          ),
          // ClipRRect(
          //     borderRadius: BorderRadius.circular(15),
          //     child: castModel.profilePath != null
          //         ? MyNetworkImage(
          //             imageUrl:
          //               (ApiData.midImageSizeUrl + castModel.profilePath!),
          //             width: width,
          //             height: height,
          //           )
          //         : Image.asset(
          //             "assets/images/user.png",
          //           width: 80,height: 80,fit: BoxFit.fill,)),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.castModel.name ?? "No name found!!",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  widget.castModel.character ?? "No name found!!",
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
              onPressed: clickOnMoreIcon,
              icon: const Icon(color: Colors.grey, Icons.more_horiz_rounded))
        ],
      ),
    );
  }

  void clickOnMoreIcon() {
    Navigator.push(context,
        PageRouteUtils.createRoute(CastDetailsMainScreen(widget.id), 1.0, 0.0));
  }
  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}


