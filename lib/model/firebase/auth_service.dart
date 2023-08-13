import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/model/firebase/firebase_collection.dart';

import '../firebaseModels/user_model.dart';

class AuthService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<int> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
      );

      if (result.status == LoginStatus.success) {
        // you are logged

        var accessToken = result.accessToken!.token;
        var credential = FacebookAuthProvider.credential(accessToken);

        var user = await FirebaseAuth.instance.signInWithCredential(credential);

        await FireBaseCollection.addUser(
            UserModel(email: user.user!.email, id: user.user!.uid));
        return 0;
      } else {
        return 1;
      }
    } catch (e) {
      return 2;
    }
  }

  static Future<bool> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      var googleAccount = await _googleSignIn.signIn();

      var googleAuth = await googleAccount!.authentication;

      var credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      var user = await FirebaseAuth.instance.signInWithCredential(credential);

      await FireBaseCollection.addUser(
          UserModel(email: user.user!.email, id: user.user!.uid));
      return true;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  static signUpWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      await FireBaseCollection.addUser(
          UserModel(email: credential.user!.email, id: credential.user!.uid));
      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 1;
      } else if (e.code == 'email-already-in-use') {
        return 2;
      }
    } catch (e) {}
  }

  static signInWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 1;
      } else if (e.code == 'wrong-password') {
        return 2;
      }
    }
  }
}
