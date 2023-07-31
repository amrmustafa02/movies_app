import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/model/api_model/video_data_model.dart';
import 'package:movies/model/firebase/firebase_collection.dart';

import '../../model/api/api_movie_manager.dart';
import '../../model/api_model/movies_details/ReviewModel.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  MovieDetailsViewModel(int id) : super(LoadingMovieDetailsState()) {
    getMovieDetails(id);
  }

  getMovieDetails(int id) async {
    MovieDetailsModel movieDetails = await ApiMovieManager.getMoviesDetails(id);
    ReviewModel reviewModel = await ApiMovieManager.getReviewsOnMovie(id);

    List<MovieItemModel> similarMovies =
        await ApiMovieManager.getMoviesSimilarForMovie(id);
    similarMovies.removeWhere(
            (item) => item.posterPath == null || item.backdropPath == null);

    List<MovieItemModel> recommendationsMovies =
        await ApiMovieManager.getMoviesRecommendationsForMovie(id);
    recommendationsMovies.removeWhere(
            (item) => item.posterPath == null || item.backdropPath == null);
    List<VideoDataModel> moviesVideos =
        await ApiMovieManager.getVideosOnMovie(id);

    String? userId = FirebaseAuth.instance.currentUser?.uid;
    var isFavorite = false;
    if (userId != null) {
      isFavorite = await FireBaseCollection.getMovieById(userId, "$id");
    }

    emit(SuccessMovieDetailsState(movieDetails, reviewModel, similarMovies,
        recommendationsMovies, moviesVideos, isFavorite));
  }
}

abstract class MovieDetailsState {}

class LoadingMovieDetailsState extends MovieDetailsState {}

class SuccessMovieDetailsState extends MovieDetailsState {
  MovieDetailsModel? movieDetailsModel;
  ReviewModel? reviewModel;
  List<MovieItemModel> recommendationsMovies;
  List<MovieItemModel> similarMovies;
  bool isFavorite;
  List<VideoDataModel> movieVideos;

  SuccessMovieDetailsState(
      this.movieDetailsModel,
      this.reviewModel,
      this.similarMovies,
      this.recommendationsMovies,
      this.movieVideos,
      this.isFavorite);
}
