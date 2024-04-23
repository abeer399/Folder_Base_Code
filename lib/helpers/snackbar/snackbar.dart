import 'package:flutter/material.dart';
import '../../utils/constant/color_constants.dart';
import '../../utils/logging/logger.dart';

class AppSnackBarClass {
  AppSnackBarClass._();
  static Future<void> showSnackBar(BuildContext context, String msg) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          msg,
          style: const TextStyle(color: AppColors.scaffoldColor),
        ),
        backgroundColor: AppColors.secondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        // margin: EdgeInsets.only(
        //     bottom: MediaQuery.of(context).size.height - 100,
        //     right: 20,
        //     left: 20),
      ));
    } catch (e) {
      logs.i(e);
    }
  }
}
