import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/controllers/api/api_cast_deatails_manager.dart';
import 'package:movies/model/api_model/cast_details/CastDetailsModel.dart';

abstract class CastDetailsState {}

class LoadingState extends CastDetailsState {}

class SuccessCastState extends CastDetailsState {
  CastDetailsModel castDetailsModel;

  SuccessCastState({required this.castDetailsModel});
}

class ErrorState extends CastDetailsState {}

class CastDetailsViewModel extends Cubit<CastDetailsState> {
  CastDetailsViewModel(int id) : super(LoadingState()) {
    getCastDetails(id);
  }

  getCastDetails(int id) async {
    CastDetailsModel castDetailsModel = await ApiCastManager.getCastDetails(id);
    emit(SuccessCastState(castDetailsModel: castDetailsModel));
  }
}
