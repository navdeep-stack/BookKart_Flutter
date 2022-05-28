import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

class SharedData {
  static writeLogInId(String id) {
    prefs!.setString("uid", id);
  }

  static readLogInId() {
    return prefs!.getString("uid") ?? "";
  }

  static logout() {
    prefs!.setString("uid", "");
  }
}
