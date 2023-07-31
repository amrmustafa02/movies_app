import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/my_theme.dart';
import 'package:movies/ui/likes_screen/cast_likes_screen.dart';
import 'package:movies/ui/likes_screen/movies_likes.dart';
import 'package:movies/ui/shared/page_route.dart';

class LikesMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Theme(
                  data: ThemeData(   splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          PageRouteUtils.createRoute(CastLikes(), 0.0, 1.0));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: MyTheme.secondColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset(
                        "assets/images/casting (1).png",
                        width: MediaQuery.sizeOf(context).width * 0.40,
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Casting",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Theme(
                  data: ThemeData(   splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          PageRouteUtils.createRoute(MoviesLikes(), 0.0, 1.0));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: MyTheme.secondColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset(
                        "assets/images/film_reel.png",
                        width: MediaQuery.sizeOf(context).width *0.40,
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Movies",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}
