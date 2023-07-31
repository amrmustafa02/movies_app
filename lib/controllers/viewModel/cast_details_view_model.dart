import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/api_model/cast_details/CastDetailsModel.dart';
import 'package:movies/model/firebase/firebase_collection.dart';

import '../../model/api/api_cast_deatails_manager.dart';
abstract class CastDetailsState {}

class LoadingState extends CastDetailsState {}

class SuccessCastState extends CastDetailsState {
  CastDetailsModel castDetailsModel;
  bool isFavorite;

  SuccessCastState({required this.castDetailsModel, required this.isFavorite});
}

class ErrorState extends CastDetailsState {}

class CastDetailsViewModel extends Cubit<CastDetailsState> {
  CastDetailsViewModel(int id) : super(LoadingState()) {
    getCastDetails(id);
  }

  getCastDetails(int castId) async {
    CastDetailsModel castDetailsModel =
        await ApiCastManager.getCastDetails(castId);
    castDetailsModel.movieCredits!.cast!.removeWhere(
            (item) => item.posterPath == null && item.backdropPath == null);

    castDetailsModel.movieCredits!.crew!.removeWhere(
            (item) => item.posterPath == null && item.backdropPath == null);

    String? userId = FirebaseAuth.instance.currentUser?.uid;

    var isFavorite = false;

    if (userId != null) {
      isFavorite = await FireBaseCollection.getCastById(userId, "$castId");
    }
    emit(SuccessCastState(
        castDetailsModel: castDetailsModel, isFavorite: isFavorite));
  }
}
