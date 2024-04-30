import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/utils/app_assets.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_empty_widget.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_cubit.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_state.dart';
import 'package:my_coupon/features/clipboard/presentation/views/widgets/clipboard_coupons_list_view_item.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';

class ClipboardCouponsListView extends StatefulWidget {
  const ClipboardCouponsListView({super.key});

  @override
  State<ClipboardCouponsListView> createState() =>
      _ClipboardCouponsListViewState();
}

class _ClipboardCouponsListViewState extends State<ClipboardCouponsListView> {
  @override
  void initState() {
    ClipboardCubit.get(context).getClipboardCoupons(
      coupons: CouponsCubit.get(context).coupons,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClipboardCubit, ClipboardState>(
      builder: (context, state) {
        if (ClipboardCubit.get(context).clipboardCoupons.isNotEmpty) {
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: AppConstants.defaultPadding),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ClipboardCouponsListViewItem(
                couponModel: ClipboardCubit.get(context).clipboardCoupons[index],
              ),
              separatorBuilder: (context, index) => Gap(AppConstants.size10h),
              itemCount: ClipboardCubit.get(context).clipboardCoupons.length,
            ),
          );
        } else {
          return Expanded(
            child: CustomEmptyWidget(
              imagePath: AppAssets.clipboard,
              title: AppStrings.clipboardIsEmptyTitle,
              subtitle: AppStrings.clipboardIsEmptySubtitle,
              imageSize: 150.h,
              paddingForBottom: 0,
            ),
          );
        }
      },
    );
  }
}
