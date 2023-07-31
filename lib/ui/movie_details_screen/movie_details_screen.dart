import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:movies/controllers/viewModel/likes_provider.dart';
import 'package:movies/my_theme.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/model/api_model/video_data_model.dart';
import 'package:movies/model/firebase/firebase_collection.dart';
import 'package:movies/ui/movie_details_screen/reviews_screen.dart';
import 'package:movies/ui/movie_details_screen/show_more_movie_details_item.dart';
import 'package:movies/ui/movie_details_screen/videos_screen/videos_screen.dart';
import 'package:provider/provider.dart';
import '../../constants/api_data.dart';
import '../../model/api_model/movies_details/ImagesOfMovies.dart';
import '../../model/api_model/movies_details/ReviewModel.dart';
import '../components/network_image.dart';
import '../components/type_movies_row.dart';
import '../shared/page_route.dart';
import 'details_tab_view.dart';

// ignore: must_be_immutable
class MovieDetailsScreen extends StatefulWidget {
  MovieDetailsModel movieDetailsModel;
  bool isFavorite;
  List<MovieItemModel> similarMovies;
  List<MovieItemModel> recommendationsMovies;
  List<VideoDataModel> moviesVideo;
  ReviewModel reviewItem;

  MovieDetailsScreen(
      {required this.movieDetailsModel,
      required this.isFavorite,
      required this.reviewItem,
      required this.recommendationsMovies,
      required this.similarMovies,
      super.key,
      required this.moviesVideo});

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

    _transTween = Tween(begin: const Offset(-5, 10), end: const Offset(-5, 0))
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
                                      ? "assets/images/no-photo.png"
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
                                    const ImageIcon(
                                      AssetImage(
                                          "assets/images/calendar(2).png"),
                                      size: 17,
                                      color: Colors.blueGrey,
                                      // color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
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
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const ImageIcon(
                                      AssetImage("assets/images/clock.png"),
                                      size: 17,
                                      color: Colors.blueGrey,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
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
                  widget.similarMovies.length > 0
                      ? TypeOfMovies(
                          fontSize: 24,
                          textColorWhite: true,
                          type: 'Similar',
                          showAll: false,
                          movies: widget.similarMovies,
                        )
                      : Container(),
                  widget.recommendationsMovies.length > 0
                      ? TypeOfMovies(
                          fontSize: 24,
                          textColorWhite: true,
                          showAll: false,
                          type: 'Recommendations',
                          movies: widget.recommendationsMovies,
                        )
                      : Container(),
                  Row(
                    children: [
                      const Spacer(),
                      ShowMoreDetailsItem(
                        iconPath: "assets/images/reviews.png",
                        iconText: 'Reviews',
                        onClick: clickOnReviewItem,
                      ),
                      const Spacer(),
                      ShowMoreDetailsItem(
                        iconPath: "assets/images/video_marketing.png",
                        iconText: 'Videos',
                        onClick: clickOnVideoItem,
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                      icon: widget.isFavorite
                          ? const Icon(
                              Icons.favorite_rounded,
                            )
                          : const Icon(
                              Icons.favorite_border_rounded,
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

  void clickOnReviewItem() {
    Navigator.push(
        context,
        PageRouteUtils.createRoute(
            ReviewScreen(reviewModel: widget.reviewItem), 0.0, 1.0));
  }

  void clickOnVideoItem() {
    Navigator.push(
        context,
        PageRouteUtils.createRoute(
            VideosScreen(
              videos: widget.moviesVideo,
            ),
            0.0,
            1.0));
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

  Route createRoute(Widget page, double x, double y) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(0.0, 1.0); bottom
        // const begin = Offset(1.0, 0.0);  left
        var begin = Offset(x, y);
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

  clickOnLove() {
    var provider = Provider.of<LikesProvider>(context, listen: false);

    var user = FirebaseAuth.instance.currentUser;
     if(user==null){
       Fluttertoast.showToast(
           msg: "Please Sign In First",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: MyTheme.primeColor,
           textColor: Colors.white,
           fontSize: 14.0
       );
       return;
     }


    if (widget.isFavorite) {
      provider.deleteMovieToLikeList("${widget.movieDetailsModel.id}");

    } else {
      provider.addMovieToLikeList(prepareMovieModel());

    }
    widget.isFavorite = !widget.isFavorite;
    setState(() {});
  }

  MovieItemModel prepareMovieModel() {
    MovieItemModel movieItemModel = MovieItemModel();
    movieItemModel.id = widget.movieDetailsModel.id;
    movieItemModel.voteCount = widget.movieDetailsModel.voteCount;
    movieItemModel.voteAverage = widget.movieDetailsModel.voteAverage;
    movieItemModel.video = false;
    movieItemModel.title = widget.movieDetailsModel.title;
    movieItemModel.posterPath = widget.movieDetailsModel.posterPath;
    movieItemModel.overview = widget.movieDetailsModel.overview;
    movieItemModel.originalTitle = widget.movieDetailsModel.originalTitle;
    movieItemModel.releaseDate = widget.movieDetailsModel.releaseDate;
    movieItemModel.backdropPath = widget.movieDetailsModel.backdropPath;
    movieItemModel.popularity = widget.movieDetailsModel.popularity;
    movieItemModel.adult = widget.movieDetailsModel.adult;
    movieItemModel.originalLanguage = widget.movieDetailsModel.originalLanguage;

    return movieItemModel;
  }
}
