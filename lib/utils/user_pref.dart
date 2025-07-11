import 'dart:convert';

import 'package:mojoodi/utils/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUserPrefs {
  static Future<void> saveUser(User info) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(info.toJson());
    await pref.setString("currUser", userJsonData);
  }

  static Future<User?> getUser() async {
    User? currUser;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userInfo = pref.getString("currUser");
    if (userInfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);
      currUser = User.fromJson(userDataMap);
    }
    return currUser;
  }

  static Future<void> deleteUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    //String userJsonData = jsonEncode(info.toJson());
    await pref.remove("currUser");
  }
}
