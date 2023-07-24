import 'package:movies/model/api_model/cast_details/Crew.dart';

import 'Cast.dart';
import 'dart:convert';

class TvCredits {
  TvCredits({
      this.cast, 
      this.crew,});

  TvCredits.fromJson(dynamic json) {
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



}