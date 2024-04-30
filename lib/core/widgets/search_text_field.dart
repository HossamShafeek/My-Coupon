import 'package:flutter/material.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/app_styles.dart';


class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    required this.onChange,
  });

  final TextEditingController controller;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      cursorColor: AppColors.primary,
      //textInputAction: TextInputAction.search,
      onChanged: onChange,
      style: AppStyles.styleRegular18White,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: AppStrings.searchHintText,
        hintStyle: AppStyles.styleRegular16Black.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
