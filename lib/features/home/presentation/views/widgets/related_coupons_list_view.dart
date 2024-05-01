import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/related_coupons_list_view_item.dart';

class RelatedCouponsListView extends StatelessWidget {
  const RelatedCouponsListView({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    CouponsCubit.get(context).getCouponsByCategoryName(
      categoryName: couponModel.categoryName,
    );
    return BlocBuilder<CouponsCubit,CouponsState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.relatedCoupons,
            style: AppStyles.styleBold18White,
          ),
          Gap(AppConstants.size10h),
          SizedBox(
            height: 80.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => RelatedCouponsListViewItem(
                couponModel:
                CouponsCubit.get(context).couponsByCategoryName[index],
              ),
              separatorBuilder: (context, index) => Gap(AppConstants.size10w),
              itemCount: CouponsCubit.get(context).couponsByCategoryName.length,
            ),
          ),
        ],
      );
    },);
  }
}