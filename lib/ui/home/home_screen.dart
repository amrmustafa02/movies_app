import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/ui/home/upcoming_movies.dart';

import '../../controllers/viewModel/home_view_model.dart';
import '../shared/components/type_movies_row.dart';
import '../shared/text_utils.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {

   return BlocBuilder<HomeViewModel, HomeState>(
     builder: (context, state) {
       if (state is LoadingState) {
         return Center(
           child:  LoadingAnimationWidget.staggeredDotsWave(
             color: Theme.of(context).primaryColor, size: 45,
           ),
         );
       }
       if (state is SuccessState) {
         return SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const SizedBox(
                 height: 10,
               ),
               Container(
                 margin: const EdgeInsets.only(left: 8),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     TextUtils.showText("Trending", 30),
                     const Text(
                       " Today",
                       style: TextStyle(color: Colors.white),
                     )
                   ],
                 ),
               ),
               const SizedBox(
                 height: 12,
               ),
               Container(
                 margin: const EdgeInsets.all(8),
                 child: UpComingMovies(
                   movies: state.posterMovies,
                 ),
               ),
               TypeOfMovies(
                 movies: state.popularMovies,
                 type: 'Popular',
               ),
               TypeOfMovies(
                 movies: state.nowPlayingMovies,
                 type: 'Now Playing',
               ),
               TypeOfMovies(
                 movies: state.topRatedMovies,
                 type: 'Top Rated',
               ),
               TypeOfMovies(
                 movies: state.upcomingMovies,
                 type: 'Upcoming',
               ),
             ],
           ),
         );

         // return
       }
       return const SizedBox(
         height: 200,
       );
     },
     bloc: viewModel,
   );
  }
}