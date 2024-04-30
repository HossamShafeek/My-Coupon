
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_styles.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(AppConstants.size15h),
        Text(
          title,
          style: AppStyles.styleBold20Primary.copyWith(
            color: AppColors.white,
          ),
        ),
        Gap(AppConstants.size8h),
        Text(
          subtitle,
          style: AppStyles.styleRegular18White.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}