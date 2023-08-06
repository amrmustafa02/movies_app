import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/cast_details/CastDetailsModel.dart';
import 'package:movies/ui/components/network_image.dart';
import 'package:movies/ui/components/type_movies_row.dart';
import 'package:movies/ui/movie_details_screen/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../controllers/viewModel/likes_provider.dart';
import '../../my_theme.dart';
import '../../model/firebase/firebase_collection.dart';
import '../shared/text_utils.dart';

class CastDetailsScreen extends StatefulWidget {
  CastDetailsModel castDetailsModel;
  bool isFavorite;

  CastDetailsScreen({required this.castDetailsModel, required this.isFavorite});

  @override
  State<CastDetailsScreen> createState() => _CastDetailsScreenState();
}

class _CastDetailsScreenState extends State<CastDetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween;
  late Animation<Offset> _transTween;

  Color appBarColor = Colors.transparent;

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 350);

      _TextAnimationController.animateTo(
          (scrollInfo.metrics.pixels - 350) / 50);
      return true;
    }
    return false;
  }

  @override
  void initState() {
    _ColorAnimationController =
        // ignore: prefer_const_constructors
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween =
        ColorTween(begin: Colors.transparent, end: const Color(0xFF0F1B2B))
            .animate(_ColorAnimationController);
    _iconColorTween =
        ColorTween(begin: MyTheme.primeColor, end: MyTheme.primeColor)
            .animate(_ColorAnimationController);

    _TextAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));

    _transTween = Tween(begin: const Offset(-5, 10), end: const Offset(-5, 0))
        .animate(_TextAnimationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          widget.castDetailsModel.profilePath != null
                              ? MyNetworkImage(
                                  imageUrl: ApiData.largeImageSizeUri +
                                      widget.castDetailsModel.profilePath!,
                                  width: size.width,
                                  height: size.height * 0.5)
                              : Image.asset("assets/images/no-photo.png"),
                          Container(
                            width: size.width,
                            height: size.height * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                                gradient: LinearGradient(
                                  colors: [
                                    // Colors.black.withOpacity(0.8),
                                    Theme.of(context)
                                        .scaffoldBackgroundColor
                                        .withOpacity(1.0),
                                    // Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                                    Colors.black.withOpacity(0.1),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                )),
                          ),
                        ],
                      ),
                      Text(
                        widget.castDetailsModel.name ?? "No Name Found!",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "LobsterRegular"),
                      )
                    ],
                  ),

                  Row(
                    children: [
                      (widget.castDetailsModel.birthday != " " &&
                              widget.castDetailsModel.birthday != null)
                          ? Expanded(
                              child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.blueGrey, width: 0.5)),
                              child: Column(
                                children: [
                                  const ImageIcon(
                                      size: 30,
                                      color: Colors.blueGrey,
                                      AssetImage(
                                          "assets/images/date_of_birth.png")),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    TextUtils.getReleaseDate(
                                        widget.castDetailsModel.birthday ?? ""),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            ))
                          : Container(),
                      widget.castDetailsModel.placeOfBirth != "" &&
                              widget.castDetailsModel.placeOfBirth != null
                          ? Expanded(
                              child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.blueGrey, width: 0.5)),
                              child: Column(
                                children: [
                                  const ImageIcon(
                                      size: 30,
                                      color: Colors.blueGrey,
                                      AssetImage("assets/images/location.png")),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      widget.castDetailsModel.placeOfBirth ?? "",
                                      textAlign: TextAlign.center,
                                      // maxLines: 1,
                                      // overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          : Container(),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  widget.castDetailsModel.biography != null &&
                          widget.castDetailsModel.biography!.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Biography",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              const SizedBox(height: 5),
                              Text(widget.castDetailsModel.biography!,style:const TextStyle(
                                  fontSize: 16, color: Colors.grey) ,),

                            ],
                          ),
                        )
                      : Container(),

                  const SizedBox(
                    height: 20,
                  ),

                  widget.castDetailsModel.movieCredits!.cast!.isNotEmpty?Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Images",
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width + 70,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return MyNetworkImage(
                                      imageUrl: ApiData.largeImageSizeUri +
                                          widget.castDetailsModel.images!
                                              .profiles![index].filePath!,
                                      width: MediaQuery.of(context).size.width - 50,
                                      height:
                                      MediaQuery.of(context).size.width + 70,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      width: 20,
                                    );
                                  },
                                  itemCount: widget
                                      .castDetailsModel.images!.profiles!.length),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ):Container(),


                  widget.castDetailsModel.movieCredits!.cast!.isNotEmpty
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: const Text(
                          "Participated as a cast member",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 250 + 20,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var movie = widget
                                  .castDetailsModel.movieCredits!.cast![index];
                              return movie.posterPath != null
                                  ? Container(
                                margin: const EdgeInsets.all(8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return MovieDetailsMainScreen(
                                            movieId: movie.id!.toInt());
                                      },
                                    ));
                                  },
                                  child: MyNetworkImage(
                                      imageUrl: ApiData.midImageSizeUrl +
                                          movie.posterPath!,
                                      width: 200,
                                      height: 250),
                                ),
                              )
                                  : Container();
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                width: 0,
                              );
                            },
                            itemCount:
                            widget.castDetailsModel.movieCredits!.cast!.length),
                      ),
                    ],
                  )
                      : Container(),
                  const SizedBox(height: 20),
                  widget.castDetailsModel.movieCredits!.crew!.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: const Text(
                                "Participated as a crew member",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                            SizedBox(
                              height: 250 + 20,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var movie = widget.castDetailsModel
                                        .movieCredits!.crew![index];
                                    return movie.posterPath != null
                                        ? Container(
                                            margin: const EdgeInsets.all(8),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return MovieDetailsMainScreen(
                                                        movieId:
                                                            movie.id!.toInt());
                                                  },
                                                ));
                                              },
                                              child: MyNetworkImage(
                                                  imageUrl:
                                                      ApiData.midImageSizeUrl +
                                                          movie.posterPath!,
                                                  width: 200,
                                                  height: 250),
                                            ),
                                          )
                                        : Container();
                                  },
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      width: 0,
                                    );
                                  },
                                  itemCount: widget.castDetailsModel
                                      .movieCredits!.crew!.length),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: AnimatedBuilder(
                animation: _ColorAnimationController,
                builder: (context, child) => AppBar(
                  backgroundColor: _colorTween.value,
                  elevation: 0,
                  titleSpacing: 0.0,
                  iconTheme: IconThemeData(
                    color: _iconColorTween.value,
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        widget.isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                      ),
                      onPressed: () {
                        clickOnLove();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  clickOnLove() {
    var provider = Provider.of<LikesProvider>(context, listen: false);

    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Fluttertoast.showToast(
          msg: "Please Sign In First",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyTheme.primeColor,
          textColor: Colors.white,
          fontSize: 14.0);
      return;
    }

    if (widget.isFavorite) {
      provider.deleteCastToLikeList("${widget.castDetailsModel.id}");
    } else {
      provider.addCastToLikeList(widget.castDetailsModel);
    }
    widget.isFavorite = !widget.isFavorite;
    setState(() {});
  }
}
