import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_coupon/config/routes/app_routes.dart';
import 'package:my_coupon/core/shimmer/shimmer_offers_list_view.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_error_widget.dart';
import 'package:my_coupon/core/widgets/loading_indicator_widget.dart';
import 'package:my_coupon/core/widgets/title_list_and_view_all.dart';
import 'package:my_coupon/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/offers_cubit/offers_state.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/offers_list_view_item.dart';

class OffersListViewForHome extends StatelessWidget {
  const OffersListViewForHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (state is OffersSuccessState ||
            state is GetSearchedOffersList ||
            state is OffersChangeIsSearchingState) {
          return Column(
            children: [
              TitleListAndViewAll(
                title: AppStrings.offers,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.allOffersView);
                },
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding:
                EdgeInsets.only(bottom: AppConstants.defaultPadding),
                itemBuilder: (context, index) {
                  return OffersListViewItem(
                    offerModel: OffersCubit.get(context).offers[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Gap(AppConstants.size10h);
                },
                itemCount: OffersCubit.get(context).offers.length >= 5
                    ? 5
                    : OffersCubit.get(context).offers.length,
              ),
            ],
          );
        } else if (state is OffersFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerOffersListView();
        }
      },
    );
  }
}
