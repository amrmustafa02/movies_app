import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/controllers/viewModel/cast_details_view_model.dart';

import 'cast_details_screen.dart';

class CastDetailsMainScreen extends StatelessWidget {
  late CastDetailsViewModel castDetailsViewModel;

  CastDetailsMainScreen(castId) {
    castDetailsViewModel = CastDetailsViewModel(castId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CastDetailsViewModel, CastDetailsState>(
        bloc: castDetailsViewModel,
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Theme.of(context).primaryColor,
                size: 45,
              ),
            );
          }
          if (state is SuccessCastState) {
            return CastDetailsScreen(castDetailsModel: state.castDetailsModel,);
          }
          return const Text(
            "Hello",
            style: TextStyle(color: Colors.white, fontSize: 30),
          );
        },
      ),
    );
  }
}
