import 'package:flutter/material.dart';

class CustomColors {
  static Color primary = HexColor("#202020");
  static Color white = HexColor("#ffffff");
  static Color black = HexColor("#000000");
  static Color grey = HexColor("#0d2C3B8B");
  static Color secondary = Colors.red;
  static Color mediumGrey200 = HexColor("#6C6D7A");
  static Color textFieldColor = HexColor("#23252C");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
