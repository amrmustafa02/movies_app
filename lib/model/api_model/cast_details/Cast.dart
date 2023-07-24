import 'dart:convert';

class Cast {
  Cast({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originCountry, 
      this.originalLanguage, 
      this.originalName, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.firstAirDate, 
      this.name, 
      this.voteAverage, 
      this.voteCount, 
      this.character, 
      this.creditId, 
      this.episodeCount,});

  Cast.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    character = json['character'];
    creditId = json['credit_id'];
    episodeCount = json['episode_count'];
  }
  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  num? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  num? voteAverage;
  num? voteCount;
  String? character;
  String? creditId;
  num? episodeCount;



}