/// id : 33
/// logo_path : "/8lvHyhjr8oUKOOy2dKXoALWKdp0.png"
/// name : "Universal Pictures"
/// origin_country : "US"

class ProductionCompanies {
  ProductionCompanies({
      num? id, 
      String? logoPath, 
      String? name, 
      String? originCountry,}){
    _id = id;
    _logoPath = logoPath;
    _name = name;
    _originCountry = originCountry;
}

  ProductionCompanies.fromJson(dynamic json) {
    _id = json['id'];
    _logoPath = json['logo_path'];
    _name = json['name'];
    _originCountry = json['origin_country'];
  }
  num? _id;
  String? _logoPath;
  String? _name;
  String? _originCountry;

  num? get id => _id;
  String? get logoPath => _logoPath;
  String? get name => _name;
  String? get originCountry => _originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['logo_path'] = _logoPath;
    map['name'] = _name;
    map['origin_country'] = _originCountry;
    return map;
  }

}