import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/config/routes/app_routes.dart';
import 'package:my_coupon/core/shimmer/shimmer_coupons_list_view.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_error_widget.dart';
import 'package:my_coupon/core/widgets/title_list_and_view_all.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/coupons_list_view_item.dart';

class CouponsListViewForHome extends StatelessWidget {
  const CouponsListViewForHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponsCubit, CouponsState>(
      builder: (context, state) {
        if (state is CouponsSuccessState ||
            state is GetSearchedCouponsList ||
            state is CouponsChangeIsSearchingState) {
          return Column(
            children: [
              TitleListAndViewAll(
                title: AppStrings.coupons,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.couponsView,
                      arguments: 'الكل');
                },
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => CouponsListViewItem(
                  couponModel: CouponsCubit.get(context).coupons[index],
                ),
                separatorBuilder: (context, index) => Gap(AppConstants.size10h),
                itemCount: CouponsCubit.get(context).coupons.length >= 5
                    ? 5
                    : CouponsCubit.get(context).coupons.length,
              ),
            ],
          );
        } else if (state is CouponsFailureState) {
          return Padding(
            padding: EdgeInsets.only(top: AppConstants.size30h),
            child: CustomErrorWidget(error: state.error),
          );
        } else {
          return const ShimmerCouponsListView();
        }
      },
    );
  }
}
