import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/functions/show_snack_bar.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_styles.dart';
import 'package:my_coupon/core/widgets/custom_network_image.dart';
import 'package:my_coupon/features/home/data/models/slider_model/slider_model.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_state.dart';

class OffersListViewItem extends StatelessWidget {
  const OffersListViewItem({super.key, required this.offerModel});

  final OfferModel offerModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsButtonsCubit, DetailsButtonsState>(
      listener: (context, state) {
        if(state is CanNotLaunchUrl){
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {},
          child: InkWell(
            onTap: () {
              DetailsButtonsCubit.get(context).launchStoreUrl(
                storeUrl: offerModel.storeUrl,
              );
            },
            child: Stack(alignment: Alignment.bottomCenter, children: [
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
          ),
        );
      },
    );
  }
}
