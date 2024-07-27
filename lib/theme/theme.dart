import 'package:flutter/material.dart';
import 'package:rssagg_flutter/theme/colors.dart';
import 'package:rssagg_flutter/theme/textstyle.dart';

export 'assets.dart';
export 'colors.dart';
export 'textstyle.dart';

class AppTheme {
  AppTheme._();

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: AppColor.secondary,
      secondary: AppColor.primary,
      surface: AppColor.secondary,
      onSurface: AppColor.textColorPrimary,
    ),
    scaffoldBackgroundColor: AppColor.scaffoldBackground,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle().copyWith(
        textStyle: WidgetStateProperty.all(AppTextStyle.heading3),
        backgroundColor: WidgetStateProperty.all(AppColor.blue),
        foregroundColor: WidgetStateProperty.all(AppColor.textColorPrimary),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: AppTextStyle.title1,
      backgroundColor: AppColor.scaffoldBackground,
      elevation: 0,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.blue,
    ),
    cardTheme: const CardTheme(
      color: AppColor.secondary,
      elevation: 0,
    ),

  );
}
