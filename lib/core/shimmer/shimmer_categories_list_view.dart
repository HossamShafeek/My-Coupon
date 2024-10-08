import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/shimmer/shimmer_container_effect.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';

class ShimmerCategoriesListView extends StatelessWidget {
  const ShimmerCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: AppConstants.size15h),
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
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppConstants.radius10r),
                ),
                padding:  EdgeInsets.all(AppConstants.size8h),
                child: Row(
                  children: [
                    ShimmerContainerEffect(
                      height: 40.h,
                      width: 40.h,
                    ),
                    Gap(AppConstants.size8w),
                    ShimmerContainerEffect(width: 60.h,),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Gap(AppConstants.size10w),
            itemCount: 3,
          ),
        )
      ],
    );
  }
}
