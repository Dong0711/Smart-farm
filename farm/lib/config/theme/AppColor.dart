import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  static const Map<int, Color> primary = <int, Color>{
    10: Color.fromRGBO(171, 210, 166, 1),
    50: Color.fromRGBO(87, 164, 77, 1),
    90: Color.fromRGBO(44, 82, 39, 1)
  };
  static const Map<int, Color> sub = <int, Color>{
    10: Color.fromRGBO(254, 235, 153, 1),
    50: Color.fromRGBO(252, 215, 51, 1),
    90: Color.fromRGBO(126, 108, 26, 1)
  };
  static const Map<int, Color> subText = <int, Color>{
    50: Color.fromRGBO(85, 85, 85, 1)
  };
  static const Map<int, Gradient> gradien = <int, Gradient>{
    50: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromRGBO(87, 164, 77, 1),
        Color.fromRGBO(252, 215, 51, 1)
      ], // Gradient from https://learnui.design/tools/gradient-generator.html
      tileMode: TileMode.mirror,
    ),
  };
}
