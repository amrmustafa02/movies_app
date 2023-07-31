import 'dart:convert';

class ProfileImage {
  ProfileImage({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  ProfileImage.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  toJson() {
    return {
      "aspect_ratio": aspectRatio,
      "height": height,
      "iso_639_1": iso6391,
      "file_path": filePath,
      "vote_average": voteAverage,
      "vote_count": voteCount,
      "width": width
    };
  }

  num? aspectRatio;
  num? height;
  dynamic iso6391;
  String? filePath;
  num? voteAverage;
  num? voteCount;
  num? width;
}
