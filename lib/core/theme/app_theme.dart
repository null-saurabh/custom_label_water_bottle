import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'design_token.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,

    // COLORS
    colorScheme: ColorScheme.light(
      primary: DT.primaryBlue,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: DT.heading,
    ),

    // GLOBAL TEXT THEME
    textTheme: TextTheme(
      // HERO / BIG HEADINGS
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 52,
        fontWeight: FontWeight.w700,
        height: 1.15,
        color: DT.heading,
      ),

      // SECTION HEADINGS
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 34,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: DT.heading,
      ),

      // SUBHEADINGS
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: DT.heading,
      ),

      // BODY TEXT
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: DT.body,
      ),

      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: DT.body,
      ),

      // BUTTON TEXT
      labelLarge: GoogleFonts.inter(
        fontSize: 15.5,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
    ),
  );
}
