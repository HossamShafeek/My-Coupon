import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:my_coupon/core/shimmer/shimmer_container_effect.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';

class ShimmerSlidersListView extends StatelessWidget {
  const ShimmerSlidersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, s) => Container(
            padding: EdgeInsets.all(AppConstants.size10h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius10r),
              color: AppColors.white,
            ),
            child: const ShimmerContainerEffect(
              width: double.infinity,
              height: double.infinity,
              borderRadius: 10.0,
            ),
          ),
          options: CarouselOptions(
            scrollPhysics: const NeverScrollableScrollPhysics(),
            aspectRatio: 2.2,
            viewportFraction: 0.80,
            enlargeCenterPage: true,
          ),
        ),
        Gap(AppConstants.size15h),
        FittedBox(
          child: Container(
            padding: EdgeInsets.all(AppConstants.size3h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius8r),
              color: AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ShimmerCircleAvatarEffect(),
                Gap(AppConstants.size5w),
                const ShimmerCircleAvatarEffect(),
                Gap(AppConstants.size5w),
                const ShimmerCircleAvatarEffect(),
                Gap(AppConstants.size5w),
                const ShimmerCircleAvatarEffect(),
                Gap(AppConstants.size5w),
                const ShimmerCircleAvatarEffect(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
