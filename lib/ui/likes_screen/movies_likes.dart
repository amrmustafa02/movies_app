import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/ui/components/no_user_item.dart';
import 'package:movies/ui/search_screen/movie_search_item.dart';
import 'package:provider/provider.dart';

import '../../controllers/viewModel/likes_provider.dart';

class MoviesLikes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LikesProvider>(context);

    var user = FirebaseAuth.instance.currentUser;

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
       title: const Text("Movies",),
      ),
      body: user == null
          ? NoUserItem()
          : FutureBuilder(
              future: provider.getAllLikesMovies(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.dotsTriangle(
                        color: Theme.of(context).primaryColor,
                        size: MediaQuery.of(context).size.width / 4),
                  );
                }
                if (snapshot.hasData) {
                  var movies = snapshot.data as List<MovieItemModel>;
                  return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return MovieSearchItem(movieItemModel: movies[index]);
                      });
                }
                return const Center(
                  child: Text(
                    "SomeThing Went Wrong",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                );
              },
            ),
    );
  }
}
