import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_coupon/core/functions/show_snack_bar.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_elevated_button.dart';
import 'package:my_coupon/core/widgets/custom_text_field.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_state.dart';
import 'package:my_coupon/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      DetailsButtonsCubit.get(context).reportContentController.clear();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsButtonsCubit, DetailsButtonsState>(
      listener: (context, state) {
        if (state is ReportSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
        } else if (state is ReportFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ReportLoadingState,
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
                key: DetailsButtonsCubit.get(context).formKey,
                child: Column(
                  children: [
                    Text(
                      AppStrings.reportOnCoupon,
                      style: AppStyles.styleBold20Primary.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    CustomTextField(
                      onTapOutsideUnFocus: false,
                      textInputType: TextInputType.text,
                      controller: DetailsButtonsCubit.get(context)
                          .reportContentController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.pleaseEnterReportContent;
                        }
                        return null;
                      },
                      title: AppStrings.reportContent,
                      hintText: AppStrings.enterReportContent,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        if (DetailsButtonsCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          DetailsButtonsCubit.get(context).sendReportOnCoupon(
                            couponModel: widget.couponModel,
                            authenticationModel:
                                ProfileCubit.get(context).authenticationModel,
                          );
                        }
                      },
                      title: AppStrings.report,
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
