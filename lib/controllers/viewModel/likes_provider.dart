import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/api_model/cast_details/CastDetailsModel.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/model/firebase/firebase_collection.dart';

class LikesProvider extends ChangeNotifier {
  Future<List<MovieItemModel>> getAllLikesMovies() async {
    var userId = FirebaseAuth.instance.currentUser!.uid;

    QuerySnapshot<MovieItemModel>? movies =
        await FireBaseCollection.getAllLikesMovies(userId);

    List<MovieItemModel> moviesItems = [];
    for (var docSnapshot in movies!.docs) {
      moviesItems.add(docSnapshot.data());
    }
    return moviesItems;
  }

  Future<List<CastDetailsModel>> getAllLikesCasts() async {
    var userId = FirebaseAuth.instance.currentUser!.uid;

    QuerySnapshot<CastDetailsModel>? movies =
        await FireBaseCollection.getAllLikesCasts(userId);

    List<CastDetailsModel> castItems = [];
    for (var docSnapshot in movies!.docs) {
      castItems.add(docSnapshot.data());
    }
    return castItems;
  }

  addMovieToLikeList(MovieItemModel movieItemModel) {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    FireBaseCollection.addMovieToLikeList(movieItemModel, userId);
    notifyListeners();
  }

  addCastToLikeList(CastDetailsModel castDetailsModel) {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    FireBaseCollection.addCastToLikeList(userId, castDetailsModel);
    notifyListeners();
  }

  deleteCastToLikeList(String castID) {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    FireBaseCollection.deleteCastFromFavorite(
      userId,
      castID,
    );
    notifyListeners();
  }

  deleteMovieToLikeList(String movieId) {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    FireBaseCollection.deleteMovieFromFavorite(userId, movieId);
    notifyListeners();
  }
}
