import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/api_model/Movie_details_model.dart';

import 'details_tab_view.dart';

// ignore: must_be_immutable
class MovieDetailsTabBar extends StatelessWidget {
  MovieDetailsModel movieDetailsModel;

  MovieDetailsTabBar({super.key, required this.movieDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: Container(
            height: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey, width: 0.3)),
            child: TabBar(
                splashFactory: NoSplash.splashFactory,
                enableFeedback: false,
                padding: const EdgeInsets.all(5),
                indicator: BoxDecoration(
                    boxShadow: [],
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).primaryColor),
                tabs: const [
                  Text("Details"),
                  Text("Reviews"),
                  Text("More"),
                ]),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 500,
          child: TabBarView(children: [
            DetailsTabView(
              imagesOfMovies: movieDetailsModel.imagesOfMovies!,
              crews: movieDetailsModel.crews!,
              overView: movieDetailsModel.overview!,
              casts: movieDetailsModel.casts!,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
          ]),
        )
      ],
    );
  }
}
