import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/config/icons/icons_broken.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_back_button.dart';
import 'package:my_coupon/core/widgets/search_text_field.dart';
import 'package:my_coupon/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/offers_cubit/offers_state.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/all_offers_view_body.dart';

class AllOffersView extends StatelessWidget {
  const AllOffersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: OffersCubit.get(context).isSearching
                ? SearchTextField(
                    controller: OffersCubit.get(context).searchController,
                    onChange: (value) {
                      if (!value.startsWith(' ')) {
                        OffersCubit.get(context).getSearchedOffersList(
                          companyName: value,
                        );
                      }
                    },
                  )
                : const Text(AppStrings.offers),
            actions: [
              OffersCubit.get(context).isSearching
                  ? IconButton(
                      onPressed: () {
                        OffersCubit.get(context).stopSearch();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: AppColors.primary,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        OffersCubit.get(context).startSearch(context);
                      },
                      icon: const Icon(
                        IconBroken.Search,
                        color: AppColors.primary,
                      ),
                    ),
            ],
          ),
          body: AllOffersViewBody(
            offers: OffersCubit.get(context).searchController.text.isNotEmpty
                ? OffersCubit.get(context).searchedOffersList
                : OffersCubit.get(context).offers,
          ),
        );
      },
    );
  }
}
