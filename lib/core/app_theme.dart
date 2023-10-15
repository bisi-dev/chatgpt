import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData originalTheme() {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    );
    return base.copyWith(
        scaffoldBackgroundColor: AppColors.kWhite,
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.kWhite,
        ));
  }
}
