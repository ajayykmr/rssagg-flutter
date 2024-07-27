import 'package:flutter/material.dart';
import 'package:rssagg_flutter/common/widgets/loading_indicator.dart';
import 'package:rssagg_flutter/theme/textstyle.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Splash Screen", style: AppTextStyle.heading1,),
          LoadingIndicator(),
        ],
      ),
    );
  }
}
