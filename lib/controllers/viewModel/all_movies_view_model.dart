import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/api_model/movie_item_model.dart';

class AllMoviesViewModle extends Cubit<AllMoviesState>{
  AllMoviesViewModle():super(InitState(movies: []));

}

abstract class AllMoviesState{}

class InitState extends AllMoviesState{
  List<MovieItemModel> movies;
  InitState({required this.movies});

}