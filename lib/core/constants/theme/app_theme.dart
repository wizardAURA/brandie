import 'package:flutter/material.dart';

import 'app_Colours.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Satoshi',
      primaryColor: AppColors.primaryGreen,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      useMaterial3: true,
    );
  }
}
