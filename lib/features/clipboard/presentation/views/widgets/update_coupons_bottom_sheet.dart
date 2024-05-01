import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_coupon/core/functions/show_snack_bar.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_elevated_button.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_cubit.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_state.dart';
import 'package:my_coupon/features/clipboard/presentation/views/widgets/category_dropdown.dart';
import 'package:my_coupon/features/clipboard/presentation/views/widgets/expiration_date.dart';
import 'package:my_coupon/features/clipboard/presentation/views/widgets/update_coupons_texts_fields.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';

class UpdateCouponBottomSheet extends StatelessWidget {
  const UpdateCouponBottomSheet({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClipboardCubit, ClipboardState>(
      listener: (context, state) {
        if (state is UpdateCouponSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
          CouponsCubit.get(context).getCoupons().then((value) {
            ClipboardCubit.get(context).getClipboardCoupons(
                coupons: CouponsCubit.get(context).coupons);
            Navigator.pop(context);
          });
        } else if (state is UpdateCouponFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateCouponLoadingState,
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: ClipboardCubit.get(context).formKey,
                child: Column(
                  children: [
                    Text(
                      AppStrings.updateCoupon,
                      style: AppStyles.styleBold20Primary.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    UpdateCouponTextsFields(couponModel: couponModel),
                    const CategoriesDropdown(),
                    const ExpirationDate(),
                    CustomElevatedButton(
                      onPressed: () {
                        if (ClipboardCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          ClipboardCubit.get(context).updateCouponFromFireStore(
                            couponId: couponModel.id,
                          );
                        }
                      },
                      title: AppStrings.update,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
