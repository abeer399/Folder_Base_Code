import '../../../../helpers/snackbar/snackbar.dart';
import '../../../department/screens/user_screen.dart';
import '/features/authentication/signin/models/login_model.dart';
import '/features/authentication/signin/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/logging/logger.dart';

final loginControllerInstance =
    ChangeNotifierProvider((ref) => LoginController());

class LoginController extends ChangeNotifier {
  TextEditingController email = TextEditingController(text: "Usman Ali");
  TextEditingController password =
      TextEditingController(text: "CwFm8hYHUhOkmf5es0xqYg==");
  final loginKey = GlobalKey<FormState>();

  bool isVisibil = false;
  bool isLoading = true;

  Future<void> loginUsers(context) async {
    try {
      final form = loginKey.currentState!;
      if (form.validate()) {
        await LoginService.postLogin(email: email.text, password: password.text)
            .then((value) {
          if (value == "Unauthenticated") {
            isBusy(context);
            AppSnackBarClass.showSnackBar(context, "Unauthenticated");
          } else {
            isBusy(context);

            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const DepartmentView()));
          }
        });
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
