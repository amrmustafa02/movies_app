/// adult : false
/// gender : 2
/// id : 12835
/// known_for_department : "Acting"
/// name : "Vin Diesel"
/// original_name : "Vin Diesel"
/// popularity : 58.215
/// profile_path : "/7rwSXluNWZAluYMOEWBxkPmckES.jpg"
/// cast_id : 0
/// character : "Dominic Toretto"
/// credit_id : "56d8c1e0c3a3681e3601fdc6"
/// order : 0

class Cast {
  Cast({
    bool? adult,
    num? gender,
    num? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    num? popularity,
    String? profilePath,
    num? castId,
    String? character,
    String? creditId,
    num? order,
  }) {
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _originalName = originalName;
    _popularity = popularity;
    _profilePath = profilePath;
    _castId = castId;
    _character = character;
    _creditId = creditId;
    _order = order;
  }

  Cast.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _originalName = json['original_name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
    _castId = json['cast_id'];
    _character = json['character'];
    _creditId = json['credit_id'];
    _order = json['order'];
  }

  bool? _adult;
  num? _gender;
  num? _id;
  String? _knownForDepartment;
  String? _name;
  String? _originalName;
  num? _popularity;
  String? _profilePath;
  num? _castId;
  String? _character;
  String? _creditId;
  num? _order;

  bool? get adult => _adult;

  num? get gender => _gender;

  num? get id => _id;

  String? get knownForDepartment => _knownForDepartment;

  String? get name => _name;

  String? get originalName => _originalName;

  num? get popularity => _popularity;

  String? get profilePath => _profilePath;

  num? get castId => _castId;

  String? get character => _character;

  String? get creditId => _creditId;

  num? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['gender'] = _gender;
    map['id'] = _id;
    map['known_for_department'] = _knownForDepartment;
    map['name'] = _name;
    map['original_name'] = _originalName;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    map['cast_id'] = _castId;
    map['character'] = _character;
    map['credit_id'] = _creditId;
    map['order'] = _order;
    return map;
  }
}
