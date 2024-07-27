import 'package:flutter/material.dart';

void showMyBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
    showDragHandle: true,
    isScrollControlled: true,
    context: context,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(child: child),
    ),
  );
}
