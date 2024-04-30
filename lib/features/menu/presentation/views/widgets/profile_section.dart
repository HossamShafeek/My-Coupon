import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/shimmer/shimmer_profile_section.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_error_widget.dart';
import 'package:my_coupon/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:my_coupon/features/menu/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:my_coupon/features/menu/presentation/views/widgets/profile_bottom_sheet.dart';
import 'package:my_coupon/features/menu/presentation/views/widgets/profile_item_widget.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetUserDataSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.account,
                style: AppStyles.styleBold20Primary.copyWith(
                  color: AppColors.white,
                ),
              ),
              ProfileItemWidget(
                title: AppStrings.firstName,
                content: state.authenticationModel.firstName,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radius25r),
                    ),
                    builder: (context) {
                      return const ProfileBottomSheet();
                    },
                  );
                },
              ),
              ProfileItemWidget(
                title: AppStrings.lastName,
                content: state.authenticationModel.lastName,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radius25r),
                    ),
                    builder: (context) {
                      return const ProfileBottomSheet();
                    },
                  );
                },
              ),
            ],
          );
        } else if (state is GetUserDataFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerProfileSection();
        }
      },
    );
  }
}
