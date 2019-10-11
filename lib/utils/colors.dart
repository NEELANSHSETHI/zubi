import 'package:flutter/material.dart';

final Color primaryColor1 = Color(0xffff7072);
final Color primaryColor2 = Color(0xff19232d);
final Color secondaryColor = Color(0xff1e2934);
final Color brightBlueColor = Color(0xff37a2f5);

class HexColor extends Color {
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(getColorFromHex(hexColor));
}