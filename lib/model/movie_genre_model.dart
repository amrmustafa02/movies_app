import 'package:movies/model/api_model/movies_details/Genre.dart';

import 'api_model/GenreModel.dart';
import 'api_model/movie_item_model.dart';

class MovieGenreModel {
  GenreModel genre;
  List<MovieItemModel> movies;

  MovieGenreModel({required this.genre, required this.movies});
}
