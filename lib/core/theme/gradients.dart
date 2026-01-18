// core/theme/gradients.dart
import 'package:flutter/material.dart';

class AppGradients {
  static const trustStrip = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFF6FAFF),
        Color(0xFFF1F6FF),
      ],
  );

  static const footerTop = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFF9FBFF),
        Color(0xFFF4F7FC),
      ],
  );

  static const footerBottom = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFF2F5FA),
        Color(0xFFEDF1F7),
      ],
  );
}
