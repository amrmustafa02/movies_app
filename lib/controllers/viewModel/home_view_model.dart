import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/controllers/api/api_manager.dart';
import 'package:movies/model/api_model/movie_item_model.dart';

import '../../ui/shared/components/boster_pages/bostar_item.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(LoadingState()) {
    getMovies();
  }

  getMovies() async {
    List<MovieItemModel> movies = await ApiManager.getPopularFilms();
    List<BackPosterItem> upcomingMovies = [];
    for (var element in movies) {
      upcomingMovies.add(BackPosterItem(
          imageUrl: element.backdropPath!, movieName: element.title!));
    }
    emit(SuccessState(upcomingMovies: upcomingMovies,movies: movies));
  }
}

abstract class HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  List<MovieItemModel> movies;
  List<BackPosterItem> upcomingMovies;

  SuccessState({required this.upcomingMovies,required this.movies});
}

class FailState extends HomeState {}
