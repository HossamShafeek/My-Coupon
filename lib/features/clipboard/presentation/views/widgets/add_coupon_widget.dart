import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/utils/app_assets.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_elevated_button.dart';
import 'package:my_coupon/features/clipboard/presentation/views/widgets/add_coupon_bottom_sheet.dart';

class AddCouponWidget extends StatelessWidget {
  const AddCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.size10h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppConstants.radius8r),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 400 / 100,
            child: Image.asset(AppAssets.coupons),
          ),
          Gap(AppConstants.size10h),
          Text(
            AppStrings.addCouponSubtitle,
            style: AppStyles.styleBold20Primary,
          ),
          Gap(AppConstants.size10h),
          CustomElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radius25r),
                ),
                builder: (context) {
                  return const AddCouponBottomSheet();
                },
              );
            },
            title: AppStrings.addCoupon,
          ),
        ],
      ),
    );
  }
}