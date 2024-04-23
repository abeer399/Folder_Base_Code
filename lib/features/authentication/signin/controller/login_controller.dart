import 'package:feature_model/utils/constant/enums.dart';
import 'package:feature_model/utils/local_storage/shared_preferences.dart';

import '/features/authentication/signin/models/login_model.dart';
import '/features/authentication/signin/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/logging/logger.dart';

final loginControllerInstance =
    ChangeNotifierProvider((ref) => LoginController());

class LoginController extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  bool isVisibil = false;
  bool isLoading = true;

  Future<void> loginUsers(context) async {
    try {
      final form = loginKey.currentState!;
      if (form.validate()) {
        var data = await LoginService.postLogin(
            email: email.text, password: password.text);
        if (data is String) {
          isBusy(context);
          var logData = loginModelFromJson(data);
          LoginModel login = logData;

          logs.i(login);
        }
      }
    } catch (e) {
      logs.i(e);
      isBusy(context);
    }
  }

  void visibilPassIcon() {
    isVisibil = !isVisibil;
    notifyListeners();
  }

  void isBusy(context) {
    isLoading = !isLoading;
    notifyListeners();
  }

  clearFunc() {
    email.clear();
    password.clear();
    isVisibil = false;
    notifyListeners();
  }
}
