import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Color Palette derived from Ademola Victor Oluokun / AVO Media
  // Primary brand cyan/azure (#31ADE1) and cyan-tinted obsidian dark surfaces
  static const Color bgDark = Color(0xFF070E17);
  static const Color bgSurface = Color(0xFF0D1726);
  static const Color bgCard = Color(0xFF112033);
  static const Color bgElevated = Color(0xFF172942);

  // Accents — Official AVO Media Electric Azure
  static const Color primaryBlue = Color(0xFF31ADE1);
  static const Color primaryBlueLight = Color(0xFF5AC2ED);
  static const Color primaryBlueDark = Color(0xFF1E8CB8);
  static const Color primaryBlueGlow = Color(0x3B31ADE1);

  // Replaced former yellow accents with signature brand blue tones
  static const Color goldAccent = Color(0xFF31ADE1);
  static const Color goldAccentLight = Color(0xFF5AC2ED);
  static const Color goldAccentDark = Color(0xFF1E8CB8);
  static const Color goldGlow = Color(0x3B31ADE1);

  static const Color whatsappGreen = Color(0xFF22C55E);
  static const Color whatsappDark = Color(0xFF15803D);

  // Neutral & Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);
  static const Color borderSubtle = Color(0xFF1E3350);
  static const Color borderCard = Color(0xFF264064);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      scaffoldBackgroundColor: bgDark,
      primaryColor: primaryBlue,
      colorScheme: const ColorScheme.dark(
        primary: primaryBlue,
        secondary: goldAccent,
        surface: bgSurface,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.montserrat(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          color: textPrimary,
          letterSpacing: -1.0,
          height: 1.15,
        ),
        displayMedium: GoogleFonts.montserrat(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: textPrimary,
          letterSpacing: -0.5,
          height: 1.2,
        ),
        headlineLarge: GoogleFonts.montserrat(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: textPrimary,
          letterSpacing: -0.3,
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleLarge: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleMedium: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        bodyLarge: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: textSecondary,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textSecondary,
          height: 1.5,
        ),
        labelLarge: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: 0.5,
        ),
      ),
      cardTheme: CardThemeData(
        color: bgCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: borderCard, width: 1),
        ),
      ),
    );
  }
}
