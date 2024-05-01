import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_network_image.dart';
import 'package:my_coupon/core/widgets/vertical_separator.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';

class RelatedCouponsListViewItem extends StatelessWidget {
  const RelatedCouponsListViewItem({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.size10h),
      height: 80.h,
      width: 150.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppConstants.radius10r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppConstants.size10h),
              child: CustomNetworkImage(image: couponModel.imageUrl),
            ),
          ),
          Gap(AppConstants.size10w),
          const CustomVerticalSeparator(),
          Gap(AppConstants.size10w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppConstants.size10h),
              child: Text(
                couponModel.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleBold16Black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}