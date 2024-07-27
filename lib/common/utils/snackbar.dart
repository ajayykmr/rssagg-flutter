import 'package:flutter/material.dart';
import 'package:rssagg_flutter/theme/theme.dart';

void showSnackBar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 1),
    content: Text(
      message,
      style: AppTextStyle.highlightedLabel1,

    ),
  ));
}
