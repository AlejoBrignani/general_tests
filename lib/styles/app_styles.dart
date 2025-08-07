import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF050A41);
  static const Color darkBlue = Color(0xFF000007);
  static const Color cardBorder = Colors.white24;
  static const Color cardGradientStart = Color(0xFF03203E);
  static const Color cardGradientEnd = Color(0xFF03203E);
  static const Color shimmerLine = Color.fromARGB(255, 50, 88, 138);
  static const Color proBorder = Color.fromARGB(198, 131, 173, 255);
  static const Color proShadow = Color.fromARGB(200, 105, 155, 255);
  static const Color fundedBorder = Color.fromARGB(189, 127, 255, 88);
  static const Color fundedGlow = Color.fromARGB(50, 133, 236, 101);
}

class AppPaddings {
  static const EdgeInsets cardPadding = EdgeInsets.all(20);
  static const EdgeInsets cardLeftPadding = EdgeInsets.only(left: 25);
  static const EdgeInsets cardButtonPadding = EdgeInsets.all(10);
}

class AppBorders {
  static final BorderRadius cardRadius = BorderRadius.circular(15);
  static final BorderRadius pillRadius = BorderRadius.circular(30);
}
