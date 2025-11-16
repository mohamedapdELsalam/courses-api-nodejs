import 'package:courses_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColorsLight.primary,
      onPrimary: AppColorsLight.white,
      secondary: AppColorsLight.secondary,
      onSecondary: AppColorsLight.onSecondary,
      error: AppColorsLight.secondary,
      onError: AppColorsLight.secondary,
      surface: AppColorsLight.surface,
      onSurface: AppColorsLight.secondary,
    ),
    primaryColor: AppColorsLight.primary,
    scaffoldBackgroundColor: AppColorsLight.background,
    fontFamily: "elmessiri",
    appBarTheme: AppBarTheme(
      color: AppColorsLight.appBarColor,
      centerTitle: true,
    ),
    cardColor: AppColorsLight.cardColor,
    cardTheme: CardThemeData(color: AppColorsLight.cardColor),

    textTheme: TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 22),
      titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      labelMedium: TextStyle(fontSize: 18, color: AppColorsLight.subTextColor),
    ),
  );
}
