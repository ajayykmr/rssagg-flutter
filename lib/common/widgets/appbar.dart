import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rssagg_flutter/theme/theme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? title;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  const MyAppBar({this.actions, super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 76,
      leading: !Navigator.canPop(context)
          ? null
          : Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.only(left: 20, top: 8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.secondary,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.navigate_before,
                ),
                color: AppColor.textColorPrimary,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

      scrolledUnderElevation: 0,
      elevation: 0,
      title: Text(title ?? ""),
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   systemNavigationBarColor: AppColor.scaffoldBackground,
      //   statusBarColor: AppColor.scaffoldBackground,
      //   // systemNavigationBarDividerColor: AppColor.primary,
      // ),
      actions: actions,
    );
  }
}
