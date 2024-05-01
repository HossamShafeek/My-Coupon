import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/config/icons/icons_broken.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_container_button.dart';
import 'package:my_coupon/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:my_coupon/features/favorites/presentation/cubits/favorites_cubit/favorites_state.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';

class DetailsFavoriteButton extends StatelessWidget {
  const DetailsFavoriteButton({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(builder: (context, state) {
      return Column(
        children: [
          CustomContainerButton(
            onTap: () {
              FavoritesCubit.get(context).checkExistingProductAndAddOrRemove(
                couponModel: couponModel,
                context: context,
              );
            },
            iconSize: 45.sp,
            icon: IconBroken.Heart,
            padding: AppConstants.size8h,
            radius: AppConstants.radius8r,
            iconColor: FavoritesCubit.get(context).favorites.contains(couponModel)
                ? AppColors.redAccent
                : AppColors.grey,
          ),
          Gap(AppConstants.size5h),
          Text(
            AppStrings.favorites,
            style: AppStyles.styleRegular16Black.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      );
    },);
  }
}