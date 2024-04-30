import 'package:flutter/material.dart';
import 'package:my_coupon/config/local/cache_helper.dart';
import 'package:my_coupon/config/routes/app_routes.dart';
import 'package:my_coupon/core/functions/show_snack_bar.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_elevated_button.dart';
import 'package:my_coupon/features/menu/presentation/views/widgets/menu_item_widget.dart';
import 'package:my_coupon/features/menu/presentation/views/widgets/profile_section.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileSection(),
          const MenuItemWidget(
            title: AppStrings.whoAreWe,
            subtitle: AppStrings.whoAreWeDescription,
          ),
          const MenuItemWidget(
            title: AppStrings.doYouHaveACoupon,
            subtitle: AppStrings.doYouHaveACouponDescription,
          ),
          const Spacer(),
          CustomElevatedButton(
              onPressed: () {
                CacheHelper.removeData(key: 'userId').then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.loginView, (route) => false);
                  showSuccessSnackBar(
                      context: context, message: 'تم تسجيل الخروج بنجاح');
                });
              },
              title: AppStrings.signOut),
        ],
      ),
    );
  }
}
