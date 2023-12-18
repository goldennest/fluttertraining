import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

extension StringExtension on String {
  String capitalizeOnlyFirstLater() {
    if (this.trim().isEmpty) return "";

    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class AppTheme{
  static Color primarycolor = Color(0xFF001085) ;
  static Color secondarycolor = Color(0xFF00d2ff) ;
  static Color cyan = HexColor("00b0bf");
  static Color white = Colors.white;
  static Color black = Colors.black;

}