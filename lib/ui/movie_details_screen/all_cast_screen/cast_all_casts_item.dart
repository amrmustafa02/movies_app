import 'package:flutter/material.dart';

import '../../../constants/api_data.dart';
import '../../../model/api_model/movies_details/Cast.dart';
import '../../cast_deatails_screen/main_screen.dart';
import '../../components/network_image.dart';
import '../../shared/page_route.dart';

// ignore: must_be_immutable
class CastViewAllItem extends StatefulWidget {
  String imagePath;
  String name;
  String secondTitle;
  int id;

  CastViewAllItem(
      {required this.name,
      required this.id,
      required this.secondTitle,
      required this.imagePath,
      super.key});

  @override
  State<CastViewAllItem> createState() => _CastViewAllItemState();
}

class _CastViewAllItemState extends State<CastViewAllItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: InkWell(
                onTap: clickOnMoreIcon,
                child: widget.imagePath.isEmpty
                    ? Image.asset(
                        "assets/images/user.png",
                        width: 70,
                        height: 70,
                        fit: BoxFit.fill,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MyNetworkImage(
                          imageUrl: ApiData.midImageSizeUrl + (widget.imagePath),
                          width: 75,
                          height: 75,
                        )),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.name.isNotEmpty ? widget.name : "No name found!!",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                child: Text(
                  widget.secondTitle.isNotEmpty
                      ? widget.secondTitle
                      : "No name found!!",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void clickOnMoreIcon() {
    Navigator.push(context,
        PageRouteUtils.createRoute(CastDetailsMainScreen(widget.id), 0.0, 1.0));
  }

  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
