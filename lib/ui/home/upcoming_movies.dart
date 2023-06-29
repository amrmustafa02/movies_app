import 'package:flutter/material.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/ui/shared/components/one_row/film_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/components/boster_pages/bostar_item.dart';

// ignore: must_be_immutable
class UpComingMovies extends StatelessWidget {
  final PageController controller = PageController();
  List<BackPosterItem> movies = [];
  UpComingMovies({super.key, required this.movies});
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              PageView(
                allowImplicitScrolling: true,
                controller: controller,
                children: movies,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: SmoothPageIndicator(
              controller: controller, // PageController
              count: 10,
              effect: ExpandingDotsEffect(
                  spacing: 8.0,
                  radius: 4.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  paintStyle: PaintingStyle.fill,
                  dotColor: Colors.grey.withOpacity(0.3),
                  activeDotColor:
                      Theme.of(context).primaryColor), // your preferred effect
              onDotClicked: (index) {}),
        )
      ],
    );
  }
}
