import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/config/icons/icons_broken.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/widgets/custom_container_button.dart';
import 'package:my_coupon/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:my_coupon/features/favorites/presentation/cubits/favorites_cubit/favorites_state.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';

class AddAndRemoveFromFavoritesButton extends StatelessWidget {

 const AddAndRemoveFromFavoritesButton({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return CustomContainerButton(
          onTap: () {
            FavoritesCubit.get(context).checkExistingProductAndAddOrRemove(
              couponModel: couponModel,
              context: context,
            );
          },
          icon: IconBroken.Heart,
          iconColor: FavoritesCubit.get(context).favorites.contains(couponModel)
              ? AppColors.redAccent
              : AppColors.grey,
        );
      },
    );
  }
}
