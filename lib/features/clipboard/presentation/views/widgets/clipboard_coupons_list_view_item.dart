import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/add_and_remove_from_favourites_button.dart';
import 'package:my_coupon/core/widgets/custom_network_image.dart';
import 'package:my_coupon/core/widgets/separator_widget.dart';
import 'package:my_coupon/features/clipboard/presentation/views/widgets/custom_slidable_widget.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';

class ClipboardCouponsListViewItem extends StatelessWidget {
  const ClipboardCouponsListViewItem({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Navigator.pushNamed(context, Routes.productDetailsView, arguments: product);
      },
      child: CustomSlidableWidget(
        couponModel: couponModel,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.size10h),
          width: double.infinity,
          height: 95.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppConstants.radius10r),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppConstants.size10h),
                  child: CustomNetworkImage(
                    borderRadius: AppConstants.radius8r,
                    image: couponModel.imageUrl,
                  ),
                ),
              ),
              Gap(AppConstants.size10w),
              const MySeparator(),
              Gap(AppConstants.size10w),
              Expanded(
                flex: 11,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppConstants.size10h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          couponModel.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppStyles.styleBold18White.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Text(
                        couponModel.companyName,
                        style: AppStyles.styleRegular16Black.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              couponModel.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: AppStyles.styleRegular16Black.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          AddAndRemoveFromFavoritesButton(
                            couponModel: couponModel,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
