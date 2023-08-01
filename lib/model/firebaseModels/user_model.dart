import 'package:movies/model/api_model/movies_details/Cast.dart';

import '../api_model/movie_item_model.dart';

class UserModel {
  String? id;
  String? email;
  List<MovieItemModel>? favouriteMovie;
  List<Cast>? favouriteCasts;

  UserModel({required this.email, required this.id});

  UserModel.fromJson(var data) {
    id = data["id"];
    email = data["email"];
    favouriteMovie = data["movies"];
    favouriteCasts = data["casts"];
  }

  toJson() {
    return {
      "id": id,
      "email": email,
    };
  }
}
