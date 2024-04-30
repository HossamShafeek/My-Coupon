import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/utils/app_assets.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_empty_widget.dart';
import 'package:my_coupon/features/home/data/models/slider_model/slider_model.dart';
import 'package:my_coupon/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/offers_cubit/offers_state.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/offers_list_view_item.dart';

class AllOffersViewBody extends StatelessWidget {
  const AllOffersViewBody({super.key, required this.offers});

  final List<OfferModel> offers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (offers.isNotEmpty) {
          return ListView.separated(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            itemCount: offers.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => OffersListViewItem(
              offerModel:offers[index],
            ),
            separatorBuilder: (context, index) =>
                SizedBox(height: AppConstants.size10h),
          );
        } else {
          return CustomEmptyWidget(
            imagePath: AppAssets.search,
            title: AppStrings.noResultTitle,
            subtitle: AppStrings.noResultSubtitle,
          );
        }
      },
    );
  }
}
