import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';

import '../../model/api_model/movies_details/ReviewModel.dart';
import '../api/api_manager.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  MovieDetailsViewModel(int id) : super(LoadingMovieDetailsState()) {
    getMovieDetails(id);
  }

  getMovieDetails(int id) async {
    MovieDetailsModel movieDetails = await ApiManager.getMoviesDetails(id);
    ReviewModel reviewModel = await ApiManager.getReviewsOnMovie(id);
    emit(SuccessMovieDetailsState(movieDetails,reviewModel));
  }
}

abstract class MovieDetailsState {}

class LoadingMovieDetailsState extends MovieDetailsState {}

class SuccessMovieDetailsState extends MovieDetailsState {
  MovieDetailsModel? movieDetailsModel;
  ReviewModel? reviewModel;

  SuccessMovieDetailsState(this.movieDetailsModel,this.reviewModel);
}
