import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/shimmer/shimmer_container_effect.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';

class ShimmerOffersListView extends StatelessWidget {
  const ShimmerOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppConstants.size15h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerContainerEffect(
                width: 60.w,
              ),
              ShimmerContainerEffect(
                width: 40.w,
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return  AspectRatio(
                aspectRatio: 2.2, child: Container(
                padding: EdgeInsets.all(AppConstants.size10h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstants.radius10r),
                  color: AppColors.white,
                ),
                child: const ShimmerContainerEffect()));
          },
          separatorBuilder: (context, index) => Gap(AppConstants.size10h),
          itemCount: 10,
        )
      ],
    );
  }
}
