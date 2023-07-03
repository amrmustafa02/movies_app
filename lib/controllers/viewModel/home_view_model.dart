import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/controllers/api/api_manager.dart';
import 'package:movies/model/api_model/movie_item_model.dart';

import '../../ui/shared/components/back_poster_item.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(LoadingState()) {
    getMovies();
  }

  getMovies() async {
    List<MovieItemModel> popular = await ApiManager.getMoivesByType("popular");
    List<MovieItemModel> upcoming = await ApiManager.getMoivesByType("upcoming");
    List<MovieItemModel> nowPlaying = await ApiManager.getMoivesByType("now_playing");
    List<MovieItemModel> topRated = await ApiManager.getMoivesByType("top_rated");
    List<MovieItemModel> trendingRated = await ApiManager.getTrendingMovies("day");
    List<BackPosterItem> posterMovies = [];
    for (int i =0;i<5;i++) {
      posterMovies.add(BackPosterItem(
          imageUrl: trendingRated[i].backdropPath!, movieName: trendingRated[i].title!));
    }
    emit(SuccessState(posterMovies: posterMovies, upcomingMovies: upcoming, nowPlayingMovies: nowPlaying, topRatedMovies: topRated, popularMovies: popular));
  }
  getTrendingMovies(String type){

  }
}

abstract class HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  List<MovieItemModel> topRatedMovies;
  List<MovieItemModel> upcomingMovies;
  List<MovieItemModel> nowPlayingMovies;
  List<BackPosterItem> posterMovies;
  List<MovieItemModel> popularMovies;

  SuccessState({required this.popularMovies,required this.posterMovies,required this.upcomingMovies,required this.nowPlayingMovies,required this.topRatedMovies});
}

class FailState extends HomeState {}