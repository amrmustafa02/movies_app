import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/ui/shared/components/one_row/film_item.dart';

import '../../text_utils.dart';

// ignore: must_be_immutable
class TypeOfMovies extends StatelessWidget {
  List<MovieItemModel> movies;

  TypeOfMovies({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    print("========${movies.length}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Popular",
                style: TextStyle(color: Colors.white, fontSize: 34),
              ),
              // TextUtils.showText("Treding", 30),
              const Spacer(),
              TextButton(
                  onPressed: () {}, child: TextUtils.showText("View All", 14))
            ],
          ),
        ),
        // Expanded(
        //   child: CarouselSlider.builder(
        //     itemCount: movies.length,
        //     itemBuilder:
        //         (BuildContext context, int itemIndex, int pageViewIndex) =>
        //             MovieItem(movieItemModel: movies[itemIndex]),
        //     options: CarouselOptions(
        //       height: double.infinity,
        //       autoPlay: true,
        //     ),
        //   ),
        // )

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
