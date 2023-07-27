/// id : 28
/// name : "Action"

class GenreModel {
  GenreModel({
      this.id, 
      this.name,});

  GenreModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}