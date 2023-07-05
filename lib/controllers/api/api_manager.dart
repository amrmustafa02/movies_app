import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';
import 'package:movies/model/api_model/movie_item_model.dart';

class ApiManager {
  static getMoviesTypeUri(int page, String type) {
    return Uri.https(ApiData.baseUrl, "/3/movie/$type",
        {"page": "$page", "language": 'en-US'});
  }

  static getTrendingMoviesUri(String type) {
    return Uri.https(
        ApiData.baseUrl, "/3/trending/movie/$type", {"language": 'en-US'});
  }

  static getVideosUri(int id) {
    return Uri.https(
        ApiData.baseUrl, "/3/movie/$id/videos", {"language": 'en-US'});
  }

  // /3/movie/385687?language=en-US&append_to_response=credits
  static getMoviesDetailsUri(int id) {
    print("============$id");
    return Uri.https(ApiData.baseUrl, "/3/movie/$id",
        {"append_to_response": "credits"});
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

  static getVideosForMovie() {}

  static getMoviesDetails(int id) async {
    // create uri

    Uri uri = getMoviesDetailsUri(id);

    // run request
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});

    // convert string to map
    var jsonResponse = jsonDecode(response.body);

    print("================ ${jsonResponse["title"]}");
    print("================ ${jsonResponse["credits"]}");
    // get  all movies
    var movieDetailsModel = MovieDetailsModel.fromJson(jsonResponse);

    return movieDetailsModel;
  }
}
