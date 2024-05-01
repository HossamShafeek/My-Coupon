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
import 'package:my_coupon/features/home/presentation/views/widgets/report_bottom_sheet.dart';

class DetailsReportButton extends StatelessWidget {
  const DetailsReportButton({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainerButton(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radius25r),
              ),
              builder: (context) {
                return  ReportBottomSheet(couponModel: couponModel);
              },
            );
          },
          icon: IconBroken.Danger,
          iconSize: 45.sp,
          padding: AppConstants.size8h,
          radius: AppConstants.radius8r,
          iconColor: AppColors.orangeAccent,
        ),
        Gap(AppConstants.size5h),
        Text(
          AppStrings.report,
          style: AppStyles.styleRegular16Black.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}