import 'package:flutter/cupertino.dart';

class ScreenUtils {
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double sizeFromRatio(BuildContext context, double size) {
    double screenWidth = MediaQuery.of(context).size.width;
    screenWidth = screenWidth > 1920 ? 1920 : screenWidth;
    return screenWidth * size / 1920;
  }

  static double mobileSizeFromRatio(BuildContext context, double size) {
    double screenWidth = MediaQuery.of(context).size.width;

    return screenWidth * size / 500;
  }
}
