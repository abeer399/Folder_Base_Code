import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constant/color_constants.dart';


class AppAppBarTheme {
  AppAppBarTheme._();

  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.statusbarColor,
        statusBarIconBrightness: Brightness.dark),
    elevation: 5,
    centerTitle: false,
    scrolledUnderElevation: 5,
    shadowColor: AppColors.black54,
    backgroundColor: AppColors.scaffoldColor,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 8,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
  ); // AppBar Theme
}
