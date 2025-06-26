import 'package:flutter/material.dart';
import 'package:rssagg_flutter/theme/theme.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  behavior: SnackBarBehavior.floating,
    elevation: 0,
    backgroundColor: AppColor.secondary,
    // duration: const Duration(seconds: 1),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(
        color: AppColor.primary
      )
    ),
    content: InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: Text(
        message,
        style: AppTextStyle.label1.copyWith(
          color: AppColor.textColorPrimary
        ),
      ),
    ),
  ));
}

