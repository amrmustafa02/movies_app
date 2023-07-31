import 'Cast.dart';
import 'Crew.dart';
import 'dart:convert';



class MovieCredits {
  MovieCredits({
    this.cast,
    this.crew,
  });

  MovieCredits.fromJson(dynamic json) {
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew?.add(Crew.fromJson(v));
      });
    }
  }

  List<Cast>? cast;
  List<Crew>? crew;

  toJson() {
    return {

    };
  }


}
