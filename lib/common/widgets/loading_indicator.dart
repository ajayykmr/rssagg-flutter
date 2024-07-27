import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;

  const LoadingIndicator({super.key, this.size = 19});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: AppColor.textColorPrimary,
      size: size,
    );
  }
}
