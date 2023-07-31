import 'package:shared_preferences/shared_preferences.dart';

class RememberMeCtrl {
  static Future<bool?> getRememberMeState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("remember_me");
  }

  static setRememberMeState(bool state) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("remember_me", state);
  }
}
