import 'package:flutter/material.dart';
import 'package:movies/ui/shared/page_route.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../model/api_model/movie_item_model.dart';
import '../../components/back_poster_item/back_poster_item.dart';
import 'all_movies_screen.dart';

// ignore: must_be_immutable
class TopRatedMovies extends StatelessWidget {
  final PageController controller = PageController();
  List<BackPosterItem> movies = [];
  String type;

  TopRatedMovies({super.key, required this.type, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              type,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 28),
            ),
            const Spacer(),
            TextButton(
              onPressed: () async {
                String apiType = convertTypeToApiHint(type);
                List<MovieItemModel> newList = [];
                for (int i = 0; i < movies.length; i++) {
                  newList.add(movies[i].movieItemModel);
                }
                await Navigator.push(
                    context,
                    PageRouteUtils.createRoute(
                        AllMoviesScreen(
                            type: type, apiType: apiType, movies: newList),
                        1.0,
                        1.0));
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
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
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
              count: movies.length ~/ 2,
              effect: ExpandingDotsEffect(
                  spacing: 8.0,
                  radius: 4.0,
                  dotWidth: 8.0,
                  dotHeight: 8.0,
                  paintStyle: PaintingStyle.fill,
                  dotColor: Colors.grey.withOpacity(0.3),
                  activeDotColor:
                      Theme.of(context).primaryColor), // your preferred effect
              onDotClicked: (index) {}),
        )
      ],
    );
  }

  String convertTypeToApiHint(String type) {
    return type.toLowerCase().replaceAll(" ", "_");
  }
}
