import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';
import 'package:movies/model/api_model/movie_item_model.dart';

import '../../model/api_model/movies_details/ReviewModel.dart';
import '../api/api_movie_manager.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  MovieDetailsViewModel(int id) : super(LoadingMovieDetailsState()) {
    getMovieDetails(id);
  }

  getMovieDetails(int id) async {
    MovieDetailsModel movieDetails = await ApiMovieManager.getMoviesDetails(id);
    ReviewModel reviewModel = await ApiMovieManager.getReviewsOnMovie(id);

    List<MovieItemModel> similarMovies =
        await ApiMovieManager.getMoviesSimilarForMovie(id);
    List<MovieItemModel> recommendationsMovies =
        await ApiMovieManager.getMoviesRecommendationsForMovie(id);

    emit(SuccessMovieDetailsState(
        movieDetails, reviewModel, similarMovies, recommendationsMovies));
  }
}

abstract class MovieDetailsState {}

class LoadingMovieDetailsState extends MovieDetailsState {}

class SuccessMovieDetailsState extends MovieDetailsState {
  MovieDetailsModel? movieDetailsModel;
  ReviewModel? reviewModel;
  List<MovieItemModel> recommendationsMovies;
  List<MovieItemModel> similarMovies;

  SuccessMovieDetailsState(this.movieDetailsModel, this.reviewModel,
      this.similarMovies, this.recommendationsMovies);
}
