import 'package:flutter/material.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_back_button.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/coupons_details_view_body.dart';

class CouponDetailsView extends StatelessWidget {
  const CouponDetailsView({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:  false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.details),
      ),
      body: CouponDetailsViewBody(couponModel: couponModel),
    );
  }
}

















