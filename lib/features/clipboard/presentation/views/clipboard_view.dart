import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/features/clipboard/presentation/views/widgets/clipboard_coupons_list_view.dart';
import 'package:my_coupon/features/clipboard/presentation/views/widgets/add_coupon_widget.dart';


class ClipboardView extends StatelessWidget {
  const ClipboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConstants.defaultPadding,
        top: AppConstants.defaultPadding,
        right: AppConstants.defaultPadding,
      ),
      child:  Column(
        children: [
          const AddCouponWidget(),
          Gap(AppConstants.size15h),
          const ClipboardCouponsListView(),
        ],
      ),
    );
  }
}


