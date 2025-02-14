import 'package:flutter/material.dart';

class AppTheme {
  final bool isDarkMode;

  AppTheme({this.isDarkMode = true});

  ColorScheme _getColorScheme() {
    if (isDarkMode) {
      return const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFD7F3FF),
        secondary: Color(0xFFe29e21),
        surface: Color(0xFF17202a),
        error: Color(0xFFEF5350),
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Color(0xFF434c57),
        onError: Colors.white,
      );
    }

    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF0277BD),
      secondary: Color(0xFFe29e21),
      surface: Colors.white,
      error: Color(0xFFB00020),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Color(0xFF434c57),
      onError: Colors.white,
    );
  }

  ThemeData getTheme() {
    final colorScheme = _getColorScheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: 'Comfortaa',
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.normal,
          color: isDarkMode ? Colors.white : Colors.black,
          fontFamily: 'Mono',
        ),
        titleMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black
        ),
        titleSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          color: isDarkMode ? Colors.white : Colors.black
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: isDarkMode ? Colors.white : Colors.black
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: isDarkMode ? Colors.white : Colors.black
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isDarkMode ? Colors.white : Colors.black
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: isDarkMode ? Colors.white : Colors.black,
        centerTitle: false,
      ),
    );
  }

  AppTheme copyWith({
    bool? isDarkMode
  }) => AppTheme(
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );

}