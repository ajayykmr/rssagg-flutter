import 'package:flutter/material.dart';
import 'theme.dart';

class AppTextStyle {
  AppTextStyle._();

  static const TextStyle heading1 = TextStyle(
    //splash, sign In/Up title
    fontSize: 32,
    fontWeight: FontWeight.w500,  //medium
    color: AppColor.textColorPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    //ONBOARDING
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: AppColor.textColorPrimary,
  );

  static const TextStyle heading3 = TextStyle(
    //buttons
    fontSize: 16,
    fontWeight: FontWeight.w600,  //semi bold
    color: AppColor.textColorPrimary,
  );

///////////////////////////////////////////////////////////////////////
  static const TextStyle title1 = TextStyle(
    //title, list heading. appbar title
    fontSize: 18,
    fontWeight: FontWeight.w500,  //medium
    color: AppColor.textColorPrimary,
  );

  static const TextStyle title2 = TextStyle(
    //body, list item title
    fontSize: 16,
    fontWeight: FontWeight.w500,  //medium
    color: AppColor.textColorPrimary,
  );

  static const TextStyle title3 = TextStyle(
    //textfield
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.textColorPrimary,
  );

  static const TextStyle textField = title3;

///////////////////////////////////////////////////////////////////////

  static const TextStyle highlightedLabel1 = TextStyle(
    // already signed up?
    fontSize: 14,
    fontWeight: FontWeight.w400,  //normal, regular
    color: AppColor.textColorSecondary,
  );
  static const TextStyle label1 = TextStyle(
    //  onbarding subtitle
    fontSize: 14,
    fontWeight: FontWeight.w400,  //normal, regular
    color: AppColor.textColorTertiary,
  );


  static const TextStyle highlightedLabel2 = TextStyle(
    // list item subtitle/label
    fontSize: 12,
    fontWeight: FontWeight.w400,  //normal, regular
    color: AppColor.textColorSecondary,
  );

  static const TextStyle highlightedLabel3 = TextStyle(
    //small stuffs
    fontSize: 9,
    fontWeight: FontWeight.w400,  //normal, regular
    color: AppColor.textColorSecondary,
  );
}
