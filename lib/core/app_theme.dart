import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class AppTheme {
  static CupertinoThemeData originalTheme() {
    const base = CupertinoThemeData(brightness: Brightness.light);
    return base.copyWith(primaryColor: AppColors.kBlack);
  }
}
