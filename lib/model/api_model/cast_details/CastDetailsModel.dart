import 'MovieCredits.dart';
import 'TvCredits.dart';
import 'Images.dart';
import 'dart:convert';


class CastDetailsModel {
  CastDetailsModel({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
    this.movieCredits,
    this.tvCredits,
    this.images,
  });

  CastDetailsModel.fromJson(dynamic json) {
    adult = json['adult'];
    alsoKnownAs = json['also_known_as'] != null
        ? json['also_known_as'].cast<String>()
        : [];
    biography = json['biography'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    movieCredits = json['movie_credits'] != null
        ? MovieCredits.fromJson(json['movie_credits'])
        : null;
    tvCredits = json['tv_credits'] != null
        ? TvCredits.fromJson(json['tv_credits'])
        : null;
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }

  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  dynamic deathday;
  num? gender;
  dynamic homepage;
  num? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  num? popularity;
  String? profilePath;
  MovieCredits? movieCredits;
  TvCredits? tvCredits;
  Images? images;


}
