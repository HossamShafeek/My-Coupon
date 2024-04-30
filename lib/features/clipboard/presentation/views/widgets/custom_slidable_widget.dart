import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_coupon/config/icons/icons_broken.dart';
import 'package:my_coupon/core/functions/show_snack_bar.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_cubit.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_state.dart';
import 'package:my_coupon/features/clipboard/presentation/views/widgets/update_coupons_bottom_sheet.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';

class CustomSlidableWidget extends StatelessWidget {
  const CustomSlidableWidget(
      {super.key, required this.child, required this.couponModel});

  final Widget child;
  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClipboardCubit, ClipboardState>(
      listener: (context, state) {
        if (state is UpdateCouponSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
        } else if (state is DeleteCouponSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
          CouponsCubit.get(context).getCoupons().then((value) {
            ClipboardCubit.get(context).getClipboardCoupons(
                coupons: CouponsCubit.get(context).coupons);
          });
        } else if (state is UpdateCouponFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        } else if (state is DeleteCouponFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(AppConstants.radius8r),
                onPressed: (context) {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radius25r),
                    ),
                    builder: (context) {
                      return  UpdateCouponBottomSheet(
                        couponModel: couponModel,
                      );
                    },
                  );
                },
                backgroundColor: AppColors.blue,
                foregroundColor: Colors.white,
                icon: IconBroken.Edit,
                label: AppStrings.update,
              ),
              SlidableAction(
                borderRadius: BorderRadius.circular(AppConstants.radius8r),
                onPressed: (context) {
                  ClipboardCubit.get(context)
                      .deleteCouponFromFireStore(couponId: couponModel.id);
                },
                backgroundColor: AppColors.redAccent,
                foregroundColor: Colors.white,
                icon: IconBroken.Delete,
                label: AppStrings.delete,
              ),
            ],
          ),
          child: child,
        );
      },
    );
  }
}
