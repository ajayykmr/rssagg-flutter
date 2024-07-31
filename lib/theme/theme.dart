import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rssagg_flutter/theme/colors.dart';
import 'package:rssagg_flutter/theme/textstyle.dart';

export 'assets.dart';
export 'colors.dart';
export 'textstyle.dart';

class AppTheme {
  AppTheme._();

  static ThemeData darkTheme = ThemeData.dark().copyWith(

    brightness: Brightness.dark,
    primaryColor: AppColor.primary,
    colorScheme: ColorScheme.dark(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
    ),
    scaffoldBackgroundColor: AppColor.scaffoldBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle().copyWith(
        textStyle: WidgetStateProperty.all(AppTextStyle.heading3),
        backgroundColor: WidgetStateProperty.all(AppColor.primary),
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
      scrolledUnderElevation: 0,
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.scaffoldBackground,
        statusBarColor: AppColor.scaffoldBackground,
        systemNavigationBarDividerColor: AppColor.scaffoldBackground,
      ),
    ),

  );
}
