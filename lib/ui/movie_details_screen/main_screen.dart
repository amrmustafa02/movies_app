import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/controllers/viewModel/home_view_model.dart';
import 'package:movies/controllers/viewModel/movie_details_view_model.dart';
import 'package:movies/ui/components/network_image.dart';
import 'package:movies/ui/movie_details_screen/movie_details_screen.dart';
import 'package:skeletons/skeletons.dart';

class MovieDetailsMainScreen extends StatelessWidget {
  static const routeName = "movie-DetailsScreen";
  int movieId;
  late MovieDetailsViewModel movieDetailsViewModel;

  MovieDetailsMainScreen({super.key, required this.movieId}) {
    movieDetailsViewModel = MovieDetailsViewModel(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsViewModel, MovieDetailsState>(
        bloc: movieDetailsViewModel,
        builder: (context, state) {
          if (state is LoadingMovieDetailsState) {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Theme.of(context).primaryColor,
                size: 45,
              ),
            );
          }
          if (state is SuccessMovieDetailsState) {
            return MovieDetailsScreen(movieDetailsModel: state.movieDetailsModel!);
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
