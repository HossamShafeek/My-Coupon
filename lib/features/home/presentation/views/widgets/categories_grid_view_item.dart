import 'package:flutter/material.dart';
import 'package:my_coupon/config/routes/app_routes.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_network_image.dart';
import 'package:my_coupon/features/home/data/models/categories_model/categories_model.dart';

class CategoriesGridViewItem extends StatelessWidget {
  const CategoriesGridViewItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.couponsView,
            arguments: category.name);
      },
      child: Container(
        height: AppConstants.size50h,
        padding: EdgeInsets.all(AppConstants.size8h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppConstants.radius10r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomNetworkImage(
              height: AppConstants.size40h,
              width: AppConstants.size40h,
              image: category.image,
            ),

            Text(
              category.name,
              style: AppStyles.styleRegular16Black,
            ),
          ],
        ),
      ),
    );
  }
}