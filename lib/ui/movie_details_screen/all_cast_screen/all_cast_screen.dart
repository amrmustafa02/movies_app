import 'package:flutter/material.dart';
import 'package:movies/ui/movie_details_screen/cast_item.dart';

import '../../../model/api_model/movies_details/Cast.dart';
import '../../../model/api_model/movies_details/Crew.dart';
import 'cast_all_casts_item.dart';

class AllCastScreen extends StatelessWidget {
  List<Cast> casts;
  List<Crew> crew;

  AllCastScreen({required this.crew, required this.casts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: const Text(
          "Cast & Crew",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Cast",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: casts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CastViewAllItem(
                          imagePath: casts[index].profilePath ?? "",
                          name: casts[index].name ?? "",
                          secondTitle: casts[index].character ?? "",
                          id: casts[index].id!.toInt(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Crew",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: casts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CastViewAllItem(
                          name: crew[index].name ?? "",
                          secondTitle: crew[index].job ?? "",
                          imagePath: crew[index].profilePath ?? "", id: crew[index].id!.toInt(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
