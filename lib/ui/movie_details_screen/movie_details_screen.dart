import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:movies/main/my_theme.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/ui/movie_details_screen/reviews_tab_view.dart';
import 'package:movies/ui/movie_details_screen/show_more_movie_details_item.dart';
import '../../constants/api_data.dart';
import '../../model/api_model/movies_details/ImagesOfMovies.dart';
import '../../model/api_model/movies_details/ReviewModel.dart';
import '../components/network_image.dart';
import '../components/type_movies_row.dart';
import 'details_tab_view.dart';

// ignore: must_be_immutable
class MovieDetailsScreen extends StatefulWidget {
  MovieDetailsModel movieDetailsModel;
  List<MovieItemModel> similarMovies;
  List<MovieItemModel> recommendationsMovies;
  ReviewModel reviewItem;

  MovieDetailsScreen(
      {required this.movieDetailsModel,
      required this.reviewItem,
      required this.recommendationsMovies,
      required this.similarMovies,
      super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen>
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

    _transTween = Tween(begin: const Offset(-10, 40), end: const Offset(-10, 0))
        .animate(_TextAnimationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              MyNetworkImage(
                                  imageUrl:
                                      widget.movieDetailsModel.backdropPath ==
                                              null
                                          ? ""
                                          : ApiData.largeImageSizeUri +
                                              widget.movieDetailsModel
                                                  .backdropPath!,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.width - 100),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width - 100,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.5),
                                        Colors.black.withOpacity(0.4),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          MyNetworkImage(
                              imageUrl:
                                  widget.movieDetailsModel.posterPath == null
                                      ? "assets/images/no-image.png"
                                      : ApiData.midImageSizeUrl +
                                          widget.movieDetailsModel.posterPath!,
                              width: MediaQuery.sizeOf(context).width * 0.47,
                              height: 250),
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: (MediaQuery.sizeOf(context).width / 2) - 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  textAlign: TextAlign.start,
                                  widget.movieDetailsModel.title ??
                                      "No title found",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Text("Date",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        )),
                                    const Spacer(),
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings

                                      getReleaseDate(widget
                                              .movieDetailsModel.releaseDate ??
                                          ""),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.8)),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text("Time",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        )),
                                    const Spacer(),
                                    Text(
                                      getRunTimeByHour(
                                          widget.movieDetailsModel.runtime ??
                                              0),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.8)),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 4),
                                        alignment: Alignment.center,
                                        width: 50,
                                        height: 15,
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Text(
                                          "TMDB",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
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
                                        widget.movieDetailsModel.voteAverage!
                                            .toString()
                                            .substring(0, 3),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: const Text(
                      "Genres",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 8),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 20,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.blueGrey, width: 0.5),
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              widget.movieDetailsModel.genres![index].name!,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Container(
                              width: 10,
                            ),
                        itemCount: widget.movieDetailsModel.genres!.length),
                  ),
                  DetailsTabView(
                    imagesOfMovies: widget.movieDetailsModel.imagesOfMovies ??
                        ImagesOfMovies(),
                    crews: widget.movieDetailsModel.crews ?? [],
                    overView: widget.movieDetailsModel.overview ?? "",
                    casts: widget.movieDetailsModel.casts ?? [],
                  ),
                  TypeOfMovies(
                    fontSize: 24,
                    textColorWhite: true,
                    type: 'Similar',
                    showAll: false,
                    movies: widget.similarMovies,
                  ),
                  TypeOfMovies(
                    fontSize: 24,
                    textColorWhite: true,
                    showAll: false,
                    type: 'Recommendations',
                    movies: widget.recommendationsMovies,
                  ),

                  ShowMoreDetailsItem(
                    iconPath: "assets/images/reviews.png",
                    iconText: 'Reviews', onClick: () {  },
                  ),
                  ShowMoreDetailsItem(
                    iconPath: "assets/images/video_marketing.png",
                    iconText: 'Videos', onClick: () {  },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // ReviewsTabView(
                  //   reviewModel: widget.reviewItem,
                  // ),
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
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                      ),
                      onPressed: () {},
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

  static getRunTimeByHour(num runTime) {
    var hours = runTime ~/ 60;
    var min = runTime - (hours * 60);
    return "${hours}h ${min}m";
  }

  static getReleaseDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('MMM d, yyyy').format(dateTime);
  }

  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
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
