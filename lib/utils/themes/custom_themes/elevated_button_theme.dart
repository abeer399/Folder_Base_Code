import 'package:feature_model/utils/constant/color_constants.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  //! Light Theme
  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
    elevation: 10,
    foregroundColor: Colors.white, // Text Color (Foreground color)
    shadowColor: AppColors.secondary,
    backgroundColor: AppColors.secondary, // Background color
    // foregroundColor: Colors.white,
    // disabledForegroundColor: Colors.grey,
    // disabledBackgroundColor: Colors.grey,

    // side: const BorderSide(color: Colors.blue),
    // padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ));

  //! Dark Theme
  static final ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
    elevation: 5,
    shadowColor: const Color(0xFFF3BB2F),
    backgroundColor: const Color(0xFFF3BB2F),
    foregroundColor: Colors.white,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: Colors.blue),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ));
}
