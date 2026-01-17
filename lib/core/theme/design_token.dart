import 'package:flutter/material.dart';

class DT {
  // Layout
  static const double maxWidth = 1240;
  static const double hPadding = 72;
  static const double sectionSpacing = 96;

  // Colors
  static const Color primaryBlue = Color(0xFF0A74DA);
  static const Color heading = Color(0xFF1E3A5F);
  static const Color body = Color(0xFF5F6F82);
  static const Color lightBg = Color(0xFFEEF6FC);
  static const Color border = Color(0xFFE6EDF3);

  // Radius
  static const BorderRadius cardRadius =
  BorderRadius.all(Radius.circular(16));

  static const LinearGradient softBlueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF7FBFF), // almost white
      Color(0xFFEEF6FC), // light blue
    ],
  );

  static const RadialGradient heroGradient = RadialGradient(
    center: Alignment(-0.6, -0.3),
    radius: 1.2,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFEEF6FC),
    ],
  );

}

