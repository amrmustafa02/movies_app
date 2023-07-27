import 'dart:convert';

import 'package:movies/model/api_model/GenreModel.dart';

import '../../constants/api_data.dart';
import 'package:http/http.dart' as http;

import '../../model/api_model/movie_item_model.dart';

class ApiDiscoverManager {
  static getSearchUri(String query, int page) {
    return Uri.https(
        ApiData.baseUrl, "/3/search/movie", {"query": query, "page": "$page"});
  }

  static getSearchResult(String query, {int page = 1}) async {
    Uri uri = getSearchUri(query, page);

    // run request
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});

    var jsonResponse = jsonDecode(response.body);

    // get all movies

    List<dynamic> list = jsonResponse["results"];

    List<MovieItemModel> movies = [];

    for (int i = 0; i < list.length; i++) {
      movies.add(MovieItemModel.fromJson(list[i]));
    }
    return movies;
  }

  static getGenresUri() {
    return Uri.https(ApiData.baseUrl, "/3/genre/movie/list");
  }

  static  Future<List<GenreModel>> getGenresResult() async {
    Uri uri = getGenresUri();

    // run request
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});

    var jsonResponse = jsonDecode(response.body);

    // get all movies

    List<dynamic> list = jsonResponse["genres"];

    List<GenreModel> genres = [];

    for (int i = 0; i < list.length; i++) {
      genres.add(GenreModel.fromJson(list[i]));
    }
    return genres;
  }

  static getMoviesDiscoverUri(String genre, int page) {
    return Uri.https(ApiData.baseUrl, "/3/discover/movie",
        {"with_genres": genre, "page": "$page"});
  }

  static getDiscoverResult(String genre, {int page = 1}) async {
    Uri uri = getMoviesDiscoverUri(genre, page);

    // run request
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});

    var jsonResponse = jsonDecode(response.body);

    // get all movies

    List<dynamic> list = jsonResponse["results"];
    List<MovieItemModel> movies = [];

    for (int i = 0; i < list.length; i++) {
      movies.add(MovieItemModel.fromJson(list[i]));
    }
    return movies;
  }
}
