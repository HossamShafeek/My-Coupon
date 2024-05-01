import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_text_field.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_cubit.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_state.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';

class UpdateCouponTextsFields extends StatefulWidget {
  const UpdateCouponTextsFields({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  State<UpdateCouponTextsFields> createState() => _UpdateCouponTextsFieldsState();
}

class _UpdateCouponTextsFieldsState extends State<UpdateCouponTextsFields> {

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ClipboardCubit.get(context).companyNameController.text=widget.couponModel.companyName;
      ClipboardCubit.get(context).titleController.text=widget.couponModel.title;
      ClipboardCubit.get(context).codeController.text=widget.couponModel.code;
      ClipboardCubit.get(context).descriptionController.text=widget.couponModel.description;
      ClipboardCubit.get(context).imageUrlController.text=widget.couponModel.imageUrl;
      ClipboardCubit.get(context).storeUrlController.text=widget.couponModel.storeUrl;
      ClipboardCubit.get(context).expirationDateController.text=widget.couponModel.expirationDate;
      ClipboardCubit.get(context).categoryDropdownValue=widget.couponModel.categoryName;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClipboardCubit, ClipboardState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              onTapOutsideUnFocus: false,
              textInputType: TextInputType.text,
              controller: ClipboardCubit.get(context).companyNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterCompanyName;
                }
                return null;
              },
              title: AppStrings.companyName,
              hintText: AppStrings.enterCompanyName,
            ),
            CustomTextField(
              onTapOutsideUnFocus: false,
              textInputType: TextInputType.text,
              controller: ClipboardCubit.get(context).titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterTitle;
                }
                return null;
              },
              title: AppStrings.title,
              hintText: AppStrings.enterTitle,
            ),
            CustomTextField(
              onTapOutsideUnFocus: false,
              textInputType: TextInputType.text,
              controller: ClipboardCubit.get(context).codeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterCode;
                }
                return null;
              },
              title: AppStrings.code,
              hintText: AppStrings.enterCode,
            ),
            CustomTextField(
              onTapOutsideUnFocus: false,
              textInputType: TextInputType.text,
              controller: ClipboardCubit.get(context).descriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterDescription;
                }
                return null;
              },
              title: AppStrings.description,
              hintText: AppStrings.enterDescription,
            ),
            CustomTextField(
              onTapOutsideUnFocus: false,
              textInputType: TextInputType.text,
              controller: ClipboardCubit.get(context).imageUrlController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterImageUrl;
                }
                return null;
              },
              title: AppStrings.imageUrl,
              hintText: AppStrings.enterImageUrl,
            ),
            CustomTextField(
              onTapOutsideUnFocus: false,
              textInputType: TextInputType.text,
              controller: ClipboardCubit.get(context).storeUrlController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterStoreUrl;
                }
                return null;
              },
              title: AppStrings.storeUrl,
              hintText: AppStrings.enterStoreUrl,
            ),
          ],
        );
      },
    );
  }
}
