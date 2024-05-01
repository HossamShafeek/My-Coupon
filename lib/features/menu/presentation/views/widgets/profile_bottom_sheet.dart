import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_coupon/core/functions/show_snack_bar.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_elevated_button.dart';
import 'package:my_coupon/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:my_coupon/features/menu/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:my_coupon/features/menu/presentation/views/widgets/update_user_data_texts_fields.dart';

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is UpdateUserDataSuccessState){
          showSuccessSnackBar(context: context, message: state.message);
          ProfileCubit.get(context).getUserData().then((value) {
            Navigator.pop(context);
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateUserDataLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height/1.5,
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppConstants.radius25r),
                topLeft: Radius.circular(AppConstants.radius25r),
              ),
            ),
            child: Form(
              key: ProfileCubit.get(context).formKey,
              child: Column(
                children: [
                  Text(
                    AppStrings.updatePersonalData,
                    style: AppStyles.styleBold20Primary.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const UpdateUserDataTextsFields(),
                  CustomElevatedButton(
                    onPressed: () {
                      if(ProfileCubit.get(context).formKey.currentState!.validate()){
                        ProfileCubit.get(context).updateUserData();
                      }
                    },
                    title: AppStrings.update,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}