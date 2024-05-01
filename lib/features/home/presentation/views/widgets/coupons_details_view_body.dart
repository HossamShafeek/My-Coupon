import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/coupons_details_section.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/details_buttons_section.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/related_coupons_list_view.dart';

class CouponDetailsViewBody extends StatelessWidget {
  const CouponDetailsViewBody({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        children: [
          CouponDetailsSection(couponModel: couponModel),
          Gap(AppConstants.size15h),
          RelatedCouponsListView(couponModel: couponModel),
          Gap(AppConstants.size15h),
          DetailsButtonsSection(couponModel: couponModel),
        ],
      ),
    );
  }
}
