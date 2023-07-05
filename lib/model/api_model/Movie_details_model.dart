import 'CollectionMovieModel.dart';
import 'Cast.dart';
import 'Genre.dart';
import 'ProductionCompanies.dart';
import 'ProductionCountries.dart';
import 'SpokenLanguages.dart';


class MovieDetailsModel {
  MovieDetailsModel({
    bool? adult,
    String? backdropPath,
    CollectionMovieModel? belongsToCollection,
    num? budget,
    List<Genre>? genres,
    String? homepage,
    num? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    List<ProductionCompanies>? productionCompanies,
    List<ProductionCountries>? productionCountries,
    String? releaseDate,
    num? revenue,
    num? runtime,
    List<SpokenLanguages>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
    List<Cast>? credits,
  }) {
    _adult = adult;
    _backdropPath = backdropPath;
    _belongsToCollection = belongsToCollection;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _imdbId = imdbId;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _releaseDate = releaseDate;
    _revenue = revenue;
    _runtime = runtime;
    _status = status;
    _tagline = tagline;
    _title = title;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
    _credits = credits;
  }

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
    if (json["credits"]!=null&&json["credits"]['cast'] != null) {
      _credits = [];
      json["credits"]['cast'].forEach((v) {
        _credits?.add(Cast.fromJson(v));
      });
    }
  }

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
  List<Cast>? _credits;

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

  num? get voteAverage => _voteAverage;

  num? get voteCount => _voteCount;


}
