import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_elevated_button.dart';
import 'package:my_coupon/core/widgets/horizontal_separator.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/details_copy_button.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/details_favorite_button.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/details_report_button.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/details_share_button.dart';

class DetailsButtonsSection extends StatelessWidget {
  const DetailsButtonsSection({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 1,
          child: CustomHorizontalSeparator(color: AppColors.white),
        ),
        Gap(AppConstants.size15h),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DetailsFavoriteButton(couponModel: couponModel,),
             DetailsCopyButton(couponModel:couponModel),
             DetailsShareButton(couponModel: couponModel),
             DetailsReportButton(couponModel: couponModel),

          ],
        ),
        Gap(AppConstants.size15h),
        CustomElevatedButton(onPressed: () {}, title: AppStrings.goToShop),
      ],
    );
  }
}