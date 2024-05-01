import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/functions/show_snack_bar.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_elevated_button.dart';
import 'package:my_coupon/core/widgets/horizontal_separator.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_state.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/details_copy_button.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/details_favorite_button.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/details_report_button.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/details_share_button.dart';

class DetailsButtonsSection extends StatelessWidget {
  const DetailsButtonsSection({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsButtonsCubit,DetailsButtonsState>(
      listener: (context, state) {
        if(state is CopyCouponCodeState){
          showSuccessSnackBar(context: context, message: state.message);
        }else if(state is CanNotLaunchUrl){
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
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
                DetailsFavoriteButton(
                  couponModel: couponModel,
                ),
                DetailsCopyButton(couponModel: couponModel),
                DetailsShareButton(couponModel: couponModel),
                DetailsReportButton(couponModel: couponModel),
              ],
            ),
            Gap(AppConstants.size15h),
            CustomElevatedButton(
              onPressed: () {
                DetailsButtonsCubit.get(context).launchStoreUrl(
                  storeUrl: couponModel.storeUrl,
                );
              },
              title: AppStrings.goToShop,
            ),
          ],
        );
      },
    );
  }
}
