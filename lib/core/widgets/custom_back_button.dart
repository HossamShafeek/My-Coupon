import 'package:flutter/material.dart';
import 'package:my_coupon/config/icons/icons_broken.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        IconBroken.Arrow___Right_2,
        size: AppConstants.iconSize28,
        color: color ?? AppColors.primary,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
