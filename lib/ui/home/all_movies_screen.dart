import 'package:flutter/material.dart';
import 'package:movies/ui/shared/components/movie_item.dart';

import '../../model/api_model/movie_item_model.dart';

class AllMoviesScreen extends StatefulWidget {
  static const String routeName = "all-screen-movie";
  String apiType;
  String type;
  List<MovieItemModel> movies;
  List<Widget> moviesWidget = [];

  AllMoviesScreen(
      {super.key,
      required this.type,
      required this.apiType,
      required this.movies});

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  int page = 1;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.type),
        ),
        body: getBody());
  }

  getBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth < 250 ? 1 : 2,
              childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            return MovieItem(movieItemModel: widget.movies[index]);
          },
        );
      },
    );
  }

  convertModelToWidget() {
    int len = widget.movies.length;
    if (len % 2 == 0) {
      for (int i = 0; i < widget.movies.length; i++) {
        // widget.moviesWidget.add(null);
      }
    }
  }
}
