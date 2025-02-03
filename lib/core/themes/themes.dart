import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightMode = ThemeData(
    fontFamily: "Poppins",
    colorScheme: const ColorScheme.light(
      surface: AppColors.background,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),

      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    )
);