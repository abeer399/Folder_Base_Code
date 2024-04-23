import 'package:feature_model/utils/constant/api_constant.dart';
import 'package:feature_model/utils/http/http_client.dart';
import 'package:get_it/get_it.dart';
import '/helpers/api_helper/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/device/internet_checker.dart';
import 'dialogBox/dialog_box.dart';

final locator = GetIt.instance;
late final SharedPreferences prefs;
late String token;

void setupLocator() async {
  //* Shared Preferences
  prefs = await SharedPreferences.getInstance();

  locator.registerLazySingleton<InternetCheck>(() => InternetCheck());

  //* APIs
  locator.registerLazySingleton<ApiConstant>(() => ApiConstant());
  locator.registerLazySingleton<APIHelperClass>(() => APIHelperClass());
  locator.registerLazySingleton<AppHttpHelper>(() => AppHttpHelper());

  //* Dialog
  locator.registerLazySingleton<DialogClass>(() => DialogClass());
}
