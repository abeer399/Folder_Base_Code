// ignore_for_file: unrelated_type_equality_checks

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetCheck {
  Future<bool> iC() async {
    final result = await (Connectivity().checkConnectivity());
    if (result != ConnectivityResult.none) {
      return await InternetConnectionChecker().hasConnection;
    }
    return false;
  }
}
