import 'package:flutter/material.dart';
import 'package:rssagg_flutter/theme/theme.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(

    elevation: 0,
    backgroundColor: AppColor.textColorPrimary,
    // duration: const Duration(seconds: 1),
    content: InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: Text(
        message,
        style: AppTextStyle.label1,
      ),
    ),
  ));
}
