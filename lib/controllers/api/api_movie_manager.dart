import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/model/api_model/movies_details/ImagesOfMovies.dart';
import 'package:movies/model/api_model/movies_details/ReviewModel.dart';
import 'package:movies/model/api_model/video_data_model.dart';

class ApiMovieManager {
  static getMoviesTypeUri(int page, String type) {
    return Uri.https(ApiData.baseUrl, "/3/movie/$type",
        {"page": "$page", "language": 'en-US'});
  }

  static getUpcomingUri(int page, String startDate, String endDate) {
    return Uri.https(ApiData.baseUrl, "/3/discover/movie", {
      "page": "$page",
      "language": 'en-US',
      "primary_release_date.gte": startDate,
    });
  }

  static getTrendingMoviesUri(String type) {
    return Uri.https(
        ApiData.baseUrl, "/3/trending/movie/$type", {"language": 'en-US'});
  }

  static getUpcomingMovies(int page) async {
    DateTime startDateTime = DateTime.now().subtract(const Duration(days: 0));
    // ignore: prefer_const_constructors
    DateTime endDateTime = DateTime.now().add(Duration(days: 60));

    String startDate = DateFormat("yyyy-MM-dd").format(startDateTime);
    String endDate = DateFormat("yyyy-MM-dd").format(endDateTime);

    Uri uri = getUpcomingUri(page, startDate, endDate);

    // run request
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});

    // convert string to map
    var jsonResponse = jsonDecode(response.body);

    // get  all movies
    List<dynamic> list = jsonResponse["results"];

    List<MovieItemModel> movies = [];
    // adult = json['adult'];
    // backdropPath = json['backdrop_path'];
    // genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    // id = json['id'];
    // originalLanguage = json['original_language'];
    // originalTitle = json['original_title'];
    // overview = json['overview'];
    // popularity = json['popularity'];
    // posterPath = json['poster_path'];
    // releaseDate = json['release_date'];
    // title = json['title'];
    // video = json['video'];
    // voteAverage = json['vote_average'];
    // voteCount = json['vote_count'];
    // full list of movies model
    for (int i = 0; i < list.length; i++) {
      if (list[i]["poster_path"] != null && list[i]["backdrop_path"] != null)
        movies.add(MovieItemModel.fromJson(list[i]));
    }

    return movies;
  }

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

  static getTrendingMovies(String type) async {
    Uri uri = getTrendingMoviesUri(type);
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});

    var jsonResponse = jsonDecode(response.body);

    List<dynamic> list = jsonResponse["results"];

    List<MovieItemModel> movies = [];

    for (int i = 0; i < list.length; i++) {
      movies.add(MovieItemModel.fromJson(list[i]));
    }
    return movies;
  }

  static getMoviesByType(String type, {int page = 1}) async {
    // spacial case
    if (type == "upcoming") {
      return getUpcomingMovies(page);
    }

    // create uri
    Uri uri = getMoviesTypeUri(page, type);

    // run request
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});

    // convert string to map
    var jsonResponse = jsonDecode(response.body);

    // get  all movies
    List<dynamic> list = jsonResponse["results"];

    List<MovieItemModel> movies = [];

    // full list of movies model
    for (int i = 0; i < list.length; i++) {
      movies.add(MovieItemModel.fromJson(list[i]));
    }

    return movies;
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

  static getVideosOnMovie(int id) async {
    // create uri

    Uri uri = getVideosUri(id);

    // run request
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});

    // convert string to map
    var jsonResponse = jsonDecode(response.body);

    // get  all movies
    List<dynamic> videos = jsonResponse["results"];
    List<VideoDataModel> videoResult = [];
    for (int i = 0; i < videos.length; i++) {
      videoResult.add(VideoDataModel.fromJson(videos[i]));
    }
    return videoResult;
  }

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
