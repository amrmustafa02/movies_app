import 'package:movies/model/api_model/movies_details/ImagesOfMovies.dart';

import 'movies_details/Crew.dart';
import 'movies_details/Genre.dart';
import 'movies_details/Cast.dart';
import 'movies_details/CollectionMovieModel.dart';
import 'movies_details/ProductionCompanies.dart';
import 'movies_details/ProductionCountries.dart';

class MovieDetailsModel {
  MovieDetailsModel.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _belongsToCollection = json['belongs_to_collection'] != null
        ? CollectionMovieModel.fromJson(json['belongs_to_collection'])
        : null;
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genre.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = [];
      json['production_companies'].forEach((v) {
        _productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = [];
      json['production_countries'].forEach((v) {
        _productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    _releaseDate = json['release_date'];
    _revenue = json['revenue'];
    _runtime = json['runtime'];
    _status = json['status'];
    _tagline = json['tagline'];
    _title = json['title'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
    if (json["credits"] != null && json["credits"]['cast'] != null) {
      _casts = [];
      json["credits"]['cast'].forEach((v) {
        _casts?.add(Cast.fromJson(v));
      });
    }
    if (json["credits"] != null && json["credits"]['crew'] != null) {
      _crews = [];
      json["credits"]['crew'].forEach((v) {
        _crews?.add(Crew.fromJson(v));
      });
    }
  }
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['adult'] = adult;
  //   map['backdrop_path'] = backdropPath;
  //   map['belongs_to_collection'] = belongsToCollection;
  //   if (genres != null) {
  //     map['genres'] = genres?.map((v) => v.toJson()).toList();
  //   }
  //   map['homepage'] = homepage;
  //   map['id'] = id;
  //   map['imdb_id'] = imdbId;
  //   map['original_language'] = originalLanguage;
  //   map['original_title'] = originalTitle;
  //   map['overview'] = overview;
  //   map['popularity'] = popularity;
  //   map['poster_path'] = posterPath;
  //   if (productionCompanies != null) {
  //     map['production_companies'] =
  //         productionCompanies?.map((v) => v.toJson()).toList();
  //   }
  //   if (productionCountries != null) {
  //     map['production_countries'] =
  //         productionCountries?.map((v) => v.toJson()).toList();
  //   }
  //   map['release_date'] = releaseDate;
  //   map['revenue'] = revenue;
  //   map['runtime'] = runtime;
  //   map['status'] = status;
  //   map['tagline'] = tagline;
  //   map['title'] = title;
  //   map['vote_average'] = voteAverage;
  //   map['vote_count'] = voteCount;
  //   if (_casts != null) {
  //     map['cast'] = _casts?.map((v) => v.toJson()).toList();
  //   }
  //   if (_crews != null) {
  //     map['crew'] = _crews?.map((v) => v.toJson()).toList();
  //   }
  //   map['images'] = imagesOfMovies;
  //
  //   return map;
  // }

  bool? _adult;
  String? _backdropPath;
  CollectionMovieModel? _belongsToCollection;
  List<Genre>? _genres;
  String? _homepage;
  num? _id;
  String? _imdbId;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  List<ProductionCompanies>? _productionCompanies;
  List<ProductionCountries>? _productionCountries;
  String? _releaseDate;
  num? _revenue;
  num? _runtime;
  String? _status;
  String? _tagline;
  String? _title;
  num? _voteAverage;
  num? _voteCount;
  List<Cast>? _casts;
  List<Crew>? _crews;
  ImagesOfMovies? imagesOfMovies;

  bool? get adult => _adult;

  String? get backdropPath => _backdropPath;

  CollectionMovieModel? get belongsToCollection => _belongsToCollection;

  List<Genre>? get genres => _genres;

  String? get homepage => _homepage;

  num? get id => _id;

  String? get imdbId => _imdbId;

  String? get originalLanguage => _originalLanguage;

  String? get originalTitle => _originalTitle;

  String? get overview => _overview;

  num? get popularity => _popularity;

  String? get posterPath => _posterPath;

  List<ProductionCompanies>? get productionCompanies => _productionCompanies;

  List<ProductionCountries>? get productionCountries => _productionCountries;

  String? get releaseDate => _releaseDate;

  num? get revenue => _revenue;

  num? get runtime => _runtime;

  String? get status => _status;

  String? get tagline => _tagline;

  String? get title => _title;

  List<Cast>? get casts => _casts;

  List<Crew>? get crews => _crews;

  num? get voteAverage => _voteAverage;

  num? get voteCount => _voteCount;
}
