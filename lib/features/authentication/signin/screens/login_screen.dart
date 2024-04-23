import '/features/authentication/signin/controller/login_controller.dart';
import '/utils/constant/color_constants.dart';
import '/utils/device/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var loginController = ref.watch(loginControllerInstance);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: screenHeight * 0.4,
              width: screenWidth * 0.9,
              child: Card(
                elevation: 3,
                color: AppColors.scaffoldColor,
                child: Form(
                    key: loginController.loginKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          child: const Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Center(
                          child: SizedBox(
                            width: screenWidth * 0.8,
                            child: TextFormField(
                              controller: loginController.email,
                              keyboardType: TextInputType.emailAddress,
                              // validator: (value) =>
                              //     AppValidator.validateEmail(value),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          child: const Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Center(
                          child: SizedBox(
                            width: screenWidth * 0.8,
                            child: TextFormField(
                              controller: loginController.password,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                                  loginController.isVisibil ? false : true,
                              // validator: (value) =>
                              //     AppValidator.validatePassword(value),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    loginController.visibilPassIcon();
                                  },
                                  icon: Icon(loginController.isVisibil
                                      ? Icons.visibility
                                      : Icons.visibility_off_outlined),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.04,
          ),
          Center(
            child: SizedBox(
              width: screenWidth * 0.9,
              child: ElevatedButton(
                  onPressed: () {
                    loginController.loginUsers(context);
                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
