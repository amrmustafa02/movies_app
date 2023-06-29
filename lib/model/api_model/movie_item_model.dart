import 'dart:convert';

/// adult : false
/// backdrop_path : "/e2Jd0sYMCe6qvMbswGQbM0Mzxt0.jpg"
/// genre_ids : [28,80,53]
/// id : 385687
/// original_language : "en"
/// original_title : "Fast X"
/// overview : "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever."
/// popularity : 4654.279
/// poster_path : "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg"
/// release_date : "2023-05-17"
/// title : "Fast X"
/// video : false
/// vote_average : 7.3
/// vote_count : 2093

MovieItemModel movieItemModelFromJson(String str) =>
    MovieItemModel.fromJson(json.decode(str));


class MovieItemModel {
  MovieItemModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieItemModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  dynamic voteAverage;
  int? voteCount;
}
