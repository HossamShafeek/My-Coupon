import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_network_image.dart';
import 'package:my_coupon/core/widgets/horizontal_separator.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';

class CouponDetailsSection extends StatelessWidget {
  const CouponDetailsSection({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: CustomNetworkImage(
              image: couponModel.imageUrl,
            ),
          ),
          Gap(AppConstants.size15h),
          Text(
            couponModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleBold30White,
            textAlign: TextAlign.center,
          ),
          Gap(AppConstants.size8h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                couponModel.code,
                style: AppStyles.styleRegular18White,
              ),
              Text(
                couponModel.description,
                style: AppStyles.styleRegular18White,
              ),
            ],
          ),
          Gap(AppConstants.size15h),
          const CustomHorizontalSeparator(color: AppColors.white),
        ],
      ),
    );
  }
}