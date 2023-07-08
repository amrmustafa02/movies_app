/// id : 9485
/// name : "The Fast and the Furious Collection"
/// poster_path : "/yvr1Ziehgps1VJyug8nnezTJRJW.jpg"
/// backdrop_path : "/z5A5W3WYJc3UVEWljSGwdjDgQ0j.jpg"

class CollectionMovieModel {
  CollectionMovieModel({
    num? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) {
    _id = id;
    _name = name;
    _posterPath = posterPath;
    _backdropPath = backdropPath;
  }

  CollectionMovieModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _posterPath = json['poster_path'];
    _backdropPath = json['backdrop_path'];
  }

  num? _id;
  String? _name;
  String? _posterPath;
  String? _backdropPath;

  num? get id => _id;

  String? get name => _name;

  String? get posterPath => _posterPath;

  String? get backdropPath => _backdropPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['poster_path'] = _posterPath;
    map['backdrop_path'] = _backdropPath;
    return map;
  }
}
