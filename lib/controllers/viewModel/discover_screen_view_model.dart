import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/controllers/api/api_discover_manager.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/model/api_model/movies_details/Genre.dart';
import 'package:movies/model/movie_genre_model.dart';
import 'package:movies/ui/search_screen/movie_search_item.dart';

class DiscoverScreenViewModel extends Cubit<DiscoverScreenState> {
  DiscoverScreenViewModel() : super(DiscoverScreenLoadingState()) {
    getDiscoverResult();
  }

  getDiscoverResult() async {
    List<MovieGenreModel> movies = [];
    var genres = await ApiDiscoverManager.getGenresResult();
    for (int i = 0; i < genres.length; i++) {
      var moviesGenre =
          await ApiDiscoverManager.getDiscoverResult("${genres[i].id!}");
      movies.add(MovieGenreModel(genre: genres[i], movies: moviesGenre));
    }
    emit(DiscoverScreenSuccessState(movies: movies));
  }
}

abstract class DiscoverScreenState {}

class DiscoverScreenLoadingState extends DiscoverScreenState {}

class DiscoverScreenSuccessState extends DiscoverScreenState {
  List<MovieGenreModel> movies;

  DiscoverScreenSuccessState({required this.movies});
}

class DiscoverScreenErrorState extends DiscoverScreenState {}
