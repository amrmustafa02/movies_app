import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/movie_item_model.dart';

class ApiManager {
  static getMoviesByType(String type, {int page = 1}) async {
    Uri uri = getPopularFilmsUri(page,type);
    // print("=======================done============");
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});
    // print("=======================done==========");

    var jsonResponse = jsonDecode(response.body);
    // print("=======================done==========");

    List<dynamic> list = jsonResponse["results"];

    List<MovieItemModel> movies = [];

    for (int i = 0; i < list.length; i++) {

      dynamic test = list[i]["vote_average"];

      // print("ppppppppppp $test}");

      movies.add(MovieItemModel.fromJson(list[i]));
    }

    print("======== ${movies.length}");

    return movies;


  }

  static getPopularFilmsUri(int page,String type) {
    return Uri.https(ApiData.baseUrl, "/3/movie/$type",
        {"page": "$page", "language": 'en-US'});
  }
  static getTrendingMoviesUri(String type){
   return Uri.https(ApiData.baseUrl, "/3/trending/movie/$type",
        {"language": 'en-US'});
  }


  static getTrendingMovies(String type) async {
    Uri uri = getTrendingMoviesUri(type);
    // print("=======================done============");
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});
    // print("=======================done==========");

    var jsonResponse = jsonDecode(response.body);
    // print("=======================done==========");

    List<dynamic> list = jsonResponse["results"];

    List<MovieItemModel> movies = [];

    for (int i = 0; i < list.length; i++) {

      // dynamic test = list[i]["vote_average"];

      // print("ppppppppppp $test}");

      movies.add(MovieItemModel.fromJson(list[i]));
    }

    print("======== ${movies.length}");

    return movies;

  }
}
