import 'package:flutter/material.dart';

late MediaQueryData _mediaQueryData;
late double screenWidth;
late double screenHeight;
late double blockSizeHorizontal;
late double blockSizeVertical;

class MediaQuries {
  MediaQuries(context) {
    init(context);
  }

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  static double getWidth(double percent) {
    return (percent / 100) * screenWidth;
  }

  static double getHeight(double percent) {
    return (percent / 100) * screenHeight;
  }

  static double getHorizontalBlockSize(double percent) {
    return (percent / 100) * blockSizeHorizontal;
  }

  static double getVerticalBlockSize(double percent) {
    return (percent / 100) * blockSizeVertical;
  }
}
