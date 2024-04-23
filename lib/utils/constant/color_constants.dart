import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // App Basic Colors
  static const Color primary = Color(0xFFffffff);
  static const Color secondary = Color(0xFF56aa1c);
  static const Color accent = Color(0xFFb0c7ff);

  // Gradient Colors
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );

  // Text Field Color
  static const Color textField = Color(0xFFf5f5f5);

  // Status bar colors
  static const Color statusbarColor = Color(0xFFf2f4fd);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Scaffold Color
  static const scaffoldColor = Color(0xfffffbfe);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonCancel = Color(0xFFEFF3FF);
  static const Color buttonDeactivate = Color(0xFFFFEFEF);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D909);
  static const Color borderSecondary = Color(0xFFE6E6E6);
  static const Color imageBorder = Color(0xFFD9D9D9);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color black54 = Colors.black54;
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color lightGrey = Color.fromARGB(121, 224, 224, 224);
  static const Color transparent = Colors.transparent;

  // Pinput Colors
  static const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
  static const fillColor = Color.fromRGBO(222, 231, 240, .57);
  static const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

  // Icon Color
  static const iconBackGround = Color(0xfffafafa);
  static const Color titleColor = Color(0xff272727);

  // floating action button color
  static const Color floatingactionbuttonbackground = Color(0xffe3e8fb);

  // Chip Colors
  static const Color chipBlue = Color(0xffD2DCFF);
}
