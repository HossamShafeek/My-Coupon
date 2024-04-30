import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radius8r),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyles.styleRegular18White,
        ),
      ),
    );
  }
}
