import '/utils/constant/enums.dart';

import '../../helpers/locator.dart';
import '../logging/logger.dart';

class SharedPref {
  static void setString(UserPrefEnum name, String value) async {
    await prefs.setString(name.toString(), value).then(
          (val) => logs.i(val.toString()),
        );
  }

  static Future<String> getString(UserPrefEnum name) async {
    String? value = prefs.getString(name.toString());
    return value ?? '';
  }

  static void setBool(UserPrefEnum name, bool value) async {
    await prefs.setBool(name.toString(), value).then(
          (val) => logs.i(val.toString()),
        );
  }

  static Future getBool(UserPrefEnum name) async {
    bool? value = prefs.getBool(name.toString());

    return value ?? false;
  }

  static void logoutFunc() {
    // setString(User)
    setString(UserPrefEnum.token, '');
  }
}
