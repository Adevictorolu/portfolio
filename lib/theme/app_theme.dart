import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Minimalist Obsidian & Azure Palette — AVO Media
  static const Color bgDark = Color(0xFF060A10);
  static const Color bgSurface = Color(0xFF0B111B);
  static const Color bgCard = Color(0xFF0F1724);
  static const Color bgElevated = Color(0xFF152033);

  // Accents — Official AVO Media Electric Azure
  static const Color primaryBlue = Color(0xFF31ADE1);
  static const Color primaryBlueLight = Color(0xFF5AC2ED);
  static const Color primaryBlueDark = Color(0xFF1E8CB8);
  static const Color primaryBlueGlow = Color(0x2831ADE1);

  // Secondary Accents
  static const Color goldAccent = Color(0xFF31ADE1);
  static const Color goldAccentLight = Color(0xFF5AC2ED);
  static const Color goldAccentDark = Color(0xFF1E8CB8);
  static const Color goldGlow = Color(0x2831ADE1);

  static const Color whatsappGreen = Color(0xFF22C55E);
  static const Color whatsappDark = Color(0xFF15803D);
  static const Color pinterestRed = Color(0xFFE60023);

  // Neutral & Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);
  static const Color borderSubtle = Color(0xFF1A2639);
  static const Color borderCard = Color(0xFF21314A);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.figtree().fontFamily,
      scaffoldBackgroundColor: bgDark,
      primaryColor: primaryBlue,
      colorScheme: const ColorScheme.dark(
        primary: primaryBlue,
        secondary: goldAccent,
        surface: bgSurface,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.figtree(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          color: textPrimary,
          letterSpacing: -1.2,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.figtree(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: textPrimary,
          letterSpacing: -0.8,
          height: 1.15,
        ),
        headlineLarge: GoogleFonts.figtree(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: textPrimary,
          letterSpacing: -0.5,
        ),
        headlineMedium: GoogleFonts.figtree(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: -0.3,
        ),
        titleLarge: GoogleFonts.figtree(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleMedium: GoogleFonts.figtree(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        bodyLarge: GoogleFonts.figtree(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: textSecondary,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.figtree(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textSecondary,
          height: 1.45,
        ),
        labelLarge: GoogleFonts.figtree(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: 0.2,
        ),
      ),
      cardTheme: CardThemeData(
        color: bgCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: borderSubtle, width: 1),
        ),
      ),
    );
  }
}
