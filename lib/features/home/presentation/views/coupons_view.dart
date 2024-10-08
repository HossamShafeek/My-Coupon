import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/config/icons/icons_broken.dart';
import 'package:my_coupon/core/utils/app_assets.dart';
import 'package:my_coupon/core/utils/app_colors.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_back_button.dart';
import 'package:my_coupon/core/widgets/custom_empty_widget.dart';
import 'package:my_coupon/core/widgets/search_text_field.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/coupons_view_body.dart';

class CouponsView extends StatefulWidget {
  const CouponsView({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<CouponsView> createState() => _CouponsViewState();
}

class _CouponsViewState extends State<CouponsView> {
  @override
  void initState() {
    CouponsCubit.get(context)
        .getCouponsByCategoryName(categoryName: widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponsCubit, CouponsState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: CouponsCubit.get(context).isSearching
                ? SearchTextField(
                    controller: CouponsCubit.get(context).searchController,
                    onChange: (value) {
                      if (!value.startsWith(' ')) {
                        CouponsCubit.get(context).getSearchedCouponsList(
                          companyName: value,
                        );
                      }
                    },
                  )
                : Text(widget.categoryName),
            actions: [
              CouponsCubit.get(context).isSearching
                  ? IconButton(
                      onPressed: () {
                        CouponsCubit.get(context).stopSearch();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: AppColors.primary,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        CouponsCubit.get(context).startSearch(context);
                      },
                      icon: const Icon(
                        IconBroken.Search,
                        color: AppColors.primary,
                      ),
                    ),
            ],
          ),
          body: CouponsCubit.get(context).couponsByCategoryName.isNotEmpty
              ? CouponsViewBody(
                  coupons:
                      CouponsCubit.get(context).searchController.text.isNotEmpty
                          ? CouponsCubit.get(context).searchedCouponsList
                          : CouponsCubit.get(context).couponsByCategoryName,
                )
              : CustomEmptyWidget(
                  imagePath: AppAssets.emptyList,
                  title: AppStrings.noCouponsTitle,
                  subtitle: AppStrings.noCouponsSubtitle,
                ),
        );
      },
    );
  }
}
