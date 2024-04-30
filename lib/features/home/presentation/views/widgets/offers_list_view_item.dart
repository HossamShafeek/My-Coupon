import 'package:flutter/material.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_network_image.dart';
import 'package:my_coupon/features/home/data/models/slider_model/slider_model.dart';

class OffersListViewItem extends StatelessWidget {
  const OffersListViewItem({super.key, required this.offerModel});

  final OfferModel offerModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AspectRatio(
              aspectRatio: 2.2,
              child: CustomNetworkImage(
                fit: BoxFit.fill,
                image: offerModel.imageUlr,
              ),
            ),
            Container(
              padding: EdgeInsets.all(AppConstants.size5h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.blackWithOpacity,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    AppConstants.radius8r,
                  ),
                  bottomRight: Radius.circular(
                    AppConstants.radius8r,
                  ),
                ),
              ),
              child: Text(
                offerModel.companyName,
                style: AppStyles.styleRegular18White,
              ),
            ),
          ]),
    );
  }
}