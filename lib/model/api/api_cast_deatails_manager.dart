import 'dart:convert';

import 'package:movies/model/api_model/cast_details/CastDetailsModel.dart';

import '../../constants/api_data.dart';
import 'package:http/http.dart' as http;

class ApiCastManager {

  static getCastDetailsTypeUri(int id) {
    return Uri.https(ApiData.baseUrl, "/3/person/$id",
        {"append_to_response": "movie_credits,tv_credits,images"});
  }

  static getCastDetails(int id) async {
    Uri uri = getCastDetailsTypeUri(id);

    // run request
    var response =
        await http.get(uri, headers: {'Authorization': ApiData.token});

    var jsonResponse = jsonDecode(response.body);

    // get all movies images
    CastDetailsModel castDetailsModel = CastDetailsModel.fromJson(jsonResponse);

    return castDetailsModel;
  }

}
