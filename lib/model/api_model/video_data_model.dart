import 'dart:convert';

/// iso_639_1 : "en"
/// iso_3166_1 : "US"
/// name : "The Scene that Started the Road to Revenge"
/// key : "xZd6Kxg_MDQ"
/// site : "YouTube"
/// size : 1080
/// type : "Clip"
/// official : true
/// published_at : "2023-06-23T17:51:17.000Z"
/// id : "649a498e0e5aba00ffc351a0"


class VideoDataModel {
  VideoDataModel({
    String? iso6391,
    String? iso31661,
    String? name,
    String? key,
    String? site,
    num? size,
    String? type,
    bool? official,
    String? publishedAt,
    String? id,
  }) {
    _iso6391 = iso6391;
    _iso31661 = iso31661;
    _name = name;
    _key = key;
    _site = site;
    _size = size;
    _type = type;
    _official = official;
    _publishedAt = publishedAt;
    _id = id;
  }

  VideoDataModel.fromJson(dynamic json) {
    _iso6391 = json['iso_639_1'];
    _iso31661 = json['iso_3166_1'];
    _name = json['name'];
    _key = json['key'];
    _site = json['site'];
    _size = json['size'];
    _type = json['type'];
    _official = json['official'];
    _publishedAt = json['published_at'];
    _id = json['id'];
  }

  String? _iso6391;
  String? _iso31661;
  String? _name;
  String? _key;
  String? _site;
  num? _size;
  String? _type;
  bool? _official;
  String? _publishedAt;
  String? _id;

  String? get iso6391 => _iso6391;

  String? get iso31661 => _iso31661;

  String? get name => _name;

  String? get key => _key;

  String? get site => _site;

  num? get size => _size;

  String? get type => _type;

  bool? get official => _official;

  String? get publishedAt => _publishedAt;

  String? get id => _id;

}
