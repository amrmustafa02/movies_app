import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/ui/movies/movie_screen/trending_movies.dart';
import '../../../controllers/viewModel/home_view_model.dart';
import '../../components/type_movies_row.dart';
import '../../shared/text_utils.dart';

class HomeMovieScreen extends StatefulWidget{
  const HomeMovieScreen({super.key});

  @override
  State<HomeMovieScreen> createState() => _HomeMovieScreenState();
}

class _HomeMovieScreenState extends State<HomeMovieScreen> with AutomaticKeepAliveClientMixin{
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
                 child: TrendingMovies(
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

  @override
  bool get wantKeepAlive => true;
}