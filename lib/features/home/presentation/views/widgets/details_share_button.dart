import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/config/icons/icons_broken.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_container_button.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_cubit.dart';

class DetailsShareButton extends StatelessWidget {
  const DetailsShareButton({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: CustomContainerButton(
            onTap: () {
              DetailsButtonsCubit.get(context).shareCoupon(
                storeUrl: couponModel.storeUrl,
              );
            },
            icon: IconBroken.Logout,
            iconSize: 45.sp,
            padding: AppConstants.size8h,
            radius: AppConstants.radius8r,
            iconColor: AppColors.blue,
          ),
        ),
        Gap(AppConstants.size5h),
        Text(
          AppStrings.share,
          style: AppStyles.styleRegular16Black.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
