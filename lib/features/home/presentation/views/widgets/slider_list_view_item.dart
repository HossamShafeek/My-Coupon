import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/functions/show_snack_bar.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/widgets/custom_network_image.dart';
import 'package:my_coupon/features/home/data/models/slider_model/slider_model.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_state.dart';

class SliderListViewItem extends StatelessWidget {
  const SliderListViewItem({super.key, required this.slider});

  final OfferModel slider;

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
                storeUrl: slider
                    .storeUrl,
              );
            },
            child: CustomNetworkImage(
              image: slider.imageUlr,
              backgroundColor: AppColors.grey50,
              borderRadius: AppConstants.radius10r,
            ),
          ),
        );
      },);
  }
}