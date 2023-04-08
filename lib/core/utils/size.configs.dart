import 'package:flutter/material.dart';

// Responsive Design

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockHorizontal;
  static double? blockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockHorizontal = screenWidth! / 100;
    blockVertical = screenHeight! / 100;
  }
}
