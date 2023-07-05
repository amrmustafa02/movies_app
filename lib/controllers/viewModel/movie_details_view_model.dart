import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';

import '../api/api_manager.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  MovieDetailsViewModel(int id) : super(LoadingMovieDetailsState()) {
    getMovieDetails(id);
  }

  getMovieDetails(int id) async {
    MovieDetailsModel movieDetails = await ApiManager.getMoviesDetails(id);
    emit(SuccessMovieDetailsState(movieDetails));
  }
}

abstract class MovieDetailsState {}

class LoadingMovieDetailsState extends MovieDetailsState {}

class SuccessMovieDetailsState extends MovieDetailsState {
  MovieDetailsModel? movieDetailsModel;

  SuccessMovieDetailsState(this.movieDetailsModel);
}
