import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/shimmer/shimmer_container_effect.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';

class ShimmerCouponsListView extends StatelessWidget {
  const ShimmerCouponsListView({super.key});

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
            return Container(
              padding: EdgeInsets.all(AppConstants.size10h),
              width: double.infinity,
              height: 95.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppConstants.radius10r),
              ),
              child: Row(
                children: [
                  const Expanded(
                    flex: 4,
                    child: ShimmerContainerEffect(
                      height: double.infinity,
                    ),
                  ),
                  Gap(AppConstants.size10w),
                   Expanded(
                    flex: 11,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ShimmerContainerEffect(
                          width: double.infinity,
                        ),
                        ShimmerContainerEffect(
                          width: 120.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerContainerEffect(
                              width: 80.w,
                            ),
                            ShimmerContainerEffect(
                              width: 25.h,
                              height: 25.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Gap(AppConstants.size10w),
          itemCount: 10,
        ),
      ],
    );
  }
}
