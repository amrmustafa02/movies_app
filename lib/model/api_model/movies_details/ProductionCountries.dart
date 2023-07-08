/// iso_3166_1 : "US"
/// name : "United States of America"

class ProductionCountries {
  ProductionCountries({
      String? iso31661, 
      String? name,}){
    _iso31661 = iso31661;
    _name = name;
}

  ProductionCountries.fromJson(dynamic json) {
    _iso31661 = json['iso_3166_1'];
    _name = json['name'];
  }
  String? _iso31661;
  String? _name;

  String? get iso31661 => _iso31661;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = _iso31661;
    map['name'] = _name;
    return map;
  }

}