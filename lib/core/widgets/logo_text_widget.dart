import 'package:flutter/material.dart';
import 'package:my_coupon/core/utils/app_assets.dart';
import 'package:my_coupon/core/utils/app_constants.dart';

class LogoTextWidget extends StatelessWidget {
  const LogoTextWidget({super.key,  this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.logoText,
      width: size??AppConstants.size200w,
    );
  }
}
