import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/ui/shared/components/film_item.dart';

import '../text_utils.dart';

// ignore: must_be_immutable
class TypeOfMovies extends StatelessWidget {
  List<MovieItemModel> movies;
  String type;

  TypeOfMovies({required this.type, required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  Text(
              //   type,
              //   style: const TextStyle(color: Colors.white, fontSize: 28),
              // ),
              TextUtils.showText(type, 28),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "View All ",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Icon(Icons.arrow_forward_ios,size: 10,color: Theme.of(context).primaryColor,)
                  ],
                ),
              )
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
}
