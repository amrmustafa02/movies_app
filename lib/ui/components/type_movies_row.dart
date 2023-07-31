import 'package:flutter/material.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/ui/components/movie_item.dart';
import 'package:movies/ui/shared/page_route.dart';

import '../home/movie_screen/all_movies_screen.dart';


// ignore: must_be_immutable
class TypeOfMovies extends StatelessWidget {
  List<MovieItemModel> movies;
  String type;
  bool showAll;
  bool textColorWhite;
  double fontSize;
  TypeOfMovies({this.fontSize = 28,this.textColorWhite=false,this.showAll=true,required this.type, required this.movies, super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                type,
                style: TextStyle(color:
                textColorWhite?Colors.white:
                Theme
                    .of(context)
                    .primaryColor, fontSize: fontSize),
              ),
              // TextUtils.showText(type, 28),
              const Spacer(),
             showAll? TextButton(
                onPressed: () async {
                  String apiType = convertTypeToApiHint(type);

                  List<MovieItemModel> newList = [];
                  newList.addAll(movies);

                  Navigator.push(
                      context,
                    PageRouteUtils.createRoute(AllMoviesScreen(
                        type: type, apiType: apiType, movies: newList), 1.0, 1.0)
                  );

                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "View All ",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Theme
                          .of(context)
                          .primaryColor,
                    )
                  ],
                ),
              ):Container()
            ],
          ),
        ),

        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieItem(movieItemModel: movies[index]);
            },
          ),
        )
      ],
    );
  }

  String convertTypeToApiHint(String type) {
    return type.toLowerCase().replaceAll(" ", "_");
  }
}
