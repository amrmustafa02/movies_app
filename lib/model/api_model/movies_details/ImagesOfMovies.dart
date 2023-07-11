import 'dart:convert';



class ImagesOfMovies {
  ImagesOfMovies({
      this.backdrops, 
      this.id, 
      this.logos, 
      this.posters,});

  ImagesOfMovies.fromJson(dynamic json) {
    if (json['backdrops'] != null) {
      backdrops = [];
      json['backdrops'].forEach((v) {
        backdrops?.add(Backdrops.fromJson(v));
      });
    }
    id = json['id'];
    if (json['logos'] != null) {
      logos = [];
      json['logos'].forEach((v) {
        logos?.add(Logos.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      posters = [];
      json['posters'].forEach((v) {
        posters?.add(Posters.fromJson(v));
      });
    }
  }
  List<Backdrops>? backdrops;
  num? id;
  List<Logos>? logos;
  List<Posters>? posters;


}


class Posters {
  Posters({
      this.aspectRatio, 
      this.height, 
      this.iso6391, 
      this.filePath, 
      this.voteAverage, 
      this.voteCount, 
      this.width,});

  Posters.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }
  num? aspectRatio;
  num? height;
  String? iso6391;
  String? filePath;
  num? voteAverage;
  num? voteCount;
  num? width;


}



class Logos {
  Logos({
      this.aspectRatio, 
      this.height, 
      this.iso6391, 
      this.filePath, 
      this.voteAverage, 
      this.voteCount, 
      this.width,});

  Logos.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }
  num? aspectRatio;
  num? height;
  String? iso6391;
  String? filePath;
  num? voteAverage;
  num? voteCount;
  num? width;


}


class Backdrops {
  Backdrops({
      this.aspectRatio, 
      this.height, 
      this.iso6391, 
      this.filePath, 
      this.voteAverage, 
      this.voteCount, 
      this.width,});

  Backdrops.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }
  num? aspectRatio;
  num? height;
  dynamic iso6391;
  String? filePath;
  num? voteAverage;
  num? voteCount;
  num? width;



}