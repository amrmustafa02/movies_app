import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/model/api_model/movies_details/ImagesOfMovies.dart';
import 'package:movies/model/api_model/movies_details/ReviewModel.dart';

class ApiMovieDetailsManager{
  static getVideosUri(int id) {
    return Uri.https(
        ApiData.baseUrl, "/3/movie/$id/videos", {"language": 'en-US'});
  }

  static getImagesUri(int id) {
    return Uri.https(ApiData.baseUrl, "/3/movie/$id/images");
  }

  static getReviewUri(int id) {
    return Uri.https(ApiData.baseUrl, "/3/movie/$id/reviews");
  }

  static getSimilarMoviesUri(int id) {
    return Uri.https(ApiData.baseUrl, "/3/movie/$id/similar");
  }

  static getRecommendationsMoviesUri(int id) {
    return Uri.https(ApiData.baseUrl, "/3/movie/$id/recommendations");
  }

  static getMoviesDetailsUri(int id) {
    return Uri.https(ApiData.baseUrl, "/3/movie/$id",
        {"append_to_response": "credits,images"});
  }

  static getMoviesDetails(int id) async {
    // create uri

    Uri uri = getMoviesDetailsUri(id);

    // run request
    var response =
    await http.get(uri, headers: {'Authorization': ApiData.token});

    // convert string to map
    var jsonResponse = jsonDecode(response.body);

    // get  all movies
    var movieDetailsModel = MovieDetailsModel.fromJson(jsonResponse);
    ImagesOfMovies imagesOfMovies = await getMoviesImages(id);

    movieDetailsModel.imagesOfMovies = imagesOfMovies;

    return movieDetailsModel;
  }

  static getVideosOnMovie() {}

  static getReviewsOnMovie(int id) async {
    Uri uri = getReviewUri(id);

    // run request
    var response =
    await http.get(uri, headers: {'Authorization': ApiData.token});

    var jsonResponse = jsonDecode(response.body);

    // get all movies images
    ReviewModel imagesOfMovies = ReviewModel.fromJson(jsonResponse);

    return imagesOfMovies;
  }

  static getMoviesImages(int id) async {
    Uri uri = getImagesUri(id);

    // run request
    var response =
    await http.get(uri, headers: {'Authorization': ApiData.token});

    var jsonResponse = jsonDecode(response.body);

    // get all movies images
    ImagesOfMovies imagesOfMovies = ImagesOfMovies.fromJson(jsonResponse);

    return imagesOfMovies;
  }

  static getMoviesSimilarForMovie(int id) async {
    Uri uri = getSimilarMoviesUri(id);

    var response =
    await http.get(uri, headers: {'Authorization': ApiData.token});

    var jsonResponse = jsonDecode(response.body);

    List<dynamic> similarMoviesTest = jsonResponse["results"];
    List<MovieItemModel> similarMovies = [];
    for (int i = 0; i < similarMoviesTest.length; i++) {
      similarMovies.add(MovieItemModel.fromJson(similarMoviesTest[i]));
    }

    return similarMovies;
  }

  static getMoviesRecommendationsForMovie(int id) async {
    Uri uri = getRecommendationsMoviesUri(id);

    var response =
    await http.get(uri, headers: {'Authorization': ApiData.token});

    var jsonResponse = jsonDecode(response.body);

    List<dynamic> recommendationsMoviesTest = jsonResponse["results"];
    List<MovieItemModel> recommendationsMovies = [];

    for (int i = 0; i < recommendationsMoviesTest.length; i++) {
      recommendationsMovies
          .add(MovieItemModel.fromJson(recommendationsMoviesTest[i]));
    }

    return recommendationsMovies;
  }
}