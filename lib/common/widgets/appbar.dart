import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? title;
  final BuildContext context;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  const MyAppBar({this.actions, super.key, this.title, required this.context});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !Navigator.canPop(context)
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
      title: Text(title ?? ""),
      actions: actions,
    );
  }
}
