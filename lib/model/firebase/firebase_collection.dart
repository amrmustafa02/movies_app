import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/model/api_model/cast_details/CastDetailsModel.dart';
import 'package:movies/model/api_model/movie_item_model.dart';
import 'package:movies/model/firebaseModels/user_model.dart';

class FireBaseCollection {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static CollectionReference<MovieItemModel> getCollectionOfMovies(
      String userId) {
    return _userCollection()
        .doc(userId)
        .collection("movies")
        .withConverter<MovieItemModel>(
          fromFirestore: (snapshot, _) {
            return MovieItemModel.fromJson(snapshot);
          },
          toFirestore: (MovieItemModel movieItemModel, _) =>
              movieItemModel.toJson(),
        );
  }

  static CollectionReference<CastDetailsModel> getCollectionOfCast(
      String userId) {
    return _userCollection()
        .doc(userId)
        .collection("casts")
        .withConverter<CastDetailsModel>(
          fromFirestore: (snapshot, _) {
            return CastDetailsModel.fromJson(snapshot);
          },
          toFirestore: (CastDetailsModel movieItemModel, _) =>
              movieItemModel.toJson(),
        );
  }

  static CollectionReference<UserModel> _userCollection() {
    return _db.collection("users").withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            return UserModel.fromJson(snapshot);
          },
          toFirestore: (UserModel user, _) => user.toJson(),
        );
  }

  static Future<void> addUser(UserModel user) async {
    var collection = _userCollection();
    await collection.doc(user.id).set(user);
  }

  static addMovieToLikeList(MovieItemModel movieItemModel, String userId) {
    var moviesCollection = getCollectionOfMovies(userId);
    moviesCollection.doc("${movieItemModel.id}").set(movieItemModel);
  }

  static Future<bool> getMovieById(String userId, String movieId) async {
    var ref = getCollectionOfMovies(userId).doc(movieId).withConverter(
          fromFirestore: (snapshot, options) =>
              MovieItemModel.fromJson(snapshot),
          toFirestore: (MovieItemModel city, _) => city.toJson(),
        );
    final docSnap = await ref.get();
    final movie = docSnap.data(); // Convert to City object
    if (movie != null) {
      return true;
    } else {
      return false;
    }
  }

  static deleteMovieFromFavorite(String userId, String movieId) {
    getCollectionOfMovies(userId).doc(movieId).delete().then(
      (doc) {
        return true;
      },
      onError: (e) {
        return false;
      },
    );
  }

  static addCastToLikeList(String userId, CastDetailsModel castDetailsModel) {
    var castCollection = getCollectionOfCast(userId);
    castCollection.doc("${castDetailsModel.id}").set(castDetailsModel);
  }

  static deleteCastFromFavorite(String userId, String castId) {
    getCollectionOfCast(userId).doc(castId).delete().then(
      (doc) {
        return true;
      },
      onError: (e) {
        return false;
      },
    );
  }

  static Future<bool> getCastById(String userId, String castId) async {
    var ref = getCollectionOfCast(userId).doc(castId).withConverter(
          fromFirestore: (snapshot, options) =>
              CastDetailsModel.fromJson(snapshot),
          toFirestore: (CastDetailsModel city, _) => city.toJson(),
        );
    final docSnap = await ref.get();
    final cast = docSnap.data(); // Convert to City object
    if (cast != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<QuerySnapshot<MovieItemModel>?> getAllLikesMovies(
      String userId) async {
    try {
      var movies = await getCollectionOfMovies(userId).get();
      return movies;
    } catch (_) {
      return null;
    }
  }
  static Future<QuerySnapshot<CastDetailsModel>?> getAllLikesCasts(
      String userId) async {
    try {
      var movies = await getCollectionOfCast(userId).get();
      return movies;
    } catch (_) {
      return null;
    }
  }
}
