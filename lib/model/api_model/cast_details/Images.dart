import 'ProfileImage.dart';
import 'dart:convert';

class Images {
  Images({
    this.profiles,
  });

  Images.fromJson(dynamic json) {
    if (json['profiles'] != null) {
      profiles = [];
      json['profiles'].forEach((v) {
        profiles?.add(ProfileImage.fromJson(v));
      });
    }
  }

  List<ProfileImage>? profiles;
  toJson(){
    return {
    };
  }
}
