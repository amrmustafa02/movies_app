import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/controllers/api/api_movie_manager.dart';
import 'package:movies/model/api_model/movie_item_model.dart';

import '../../ui/components/back_poster_item/back_poster_item.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(LoadingState()) {
    getMovies();
  }

  getMovies() async {
    List<MovieItemModel> popular = await ApiMovieManager.getMoviesByType("popular");

    List<MovieItemModel> upcoming =
        await ApiMovieManager.getMoviesByType("upcoming");

    List<MovieItemModel> nowPlaying =
        await ApiMovieManager.getMoviesByType("now_playing");

    List<MovieItemModel> topRated =
        await ApiMovieManager.getMoviesByType("top_rated");

    List<MovieItemModel> trendingMovies =
        await ApiMovieManager.getTrendingMovies("day");

    List<BackPosterItem> posterMovies = [];

    for (int i = 0; i < topRated.length; i++) {
      posterMovies.add(BackPosterItem(movieItemModel: topRated[i]));
    }

    emit(SuccessState(
        posterMovies: trendingMovies,
        upcomingMovies: upcoming,
        nowPlayingMovies: nowPlaying,
        topRatedMovies: topRated,
        popularMovies: popular,
        topRatedTest: posterMovies));
  }

  getTrendingMovies(String type) {}
}

abstract class HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  List<MovieItemModel> topRatedMovies;
  List<MovieItemModel> upcomingMovies;
  List<MovieItemModel> nowPlayingMovies;
  List<MovieItemModel> posterMovies;
  List<MovieItemModel> popularMovies;
  List<BackPosterItem> topRatedTest;

  SuccessState(
      {required this.popularMovies,
      required this.topRatedTest,
      required this.posterMovies,
      required this.upcomingMovies,
      required this.nowPlayingMovies,
      required this.topRatedMovies});
}

class FailState extends HomeState {}
