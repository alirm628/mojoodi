import 'package:get/get.dart';
import 'package:mojoodi/utils/user.dart';
import 'package:mojoodi/utils/user_pref.dart';

class CurrUser {
  final Rx<User> _currentUser = User(0, '', '', '').obs;

  User get user => _currentUser.value;

  getUserInfo() async {
    User? getInfo = await RememberUserPrefs.getUser();
    _currentUser.value = getInfo!;
  }
}
