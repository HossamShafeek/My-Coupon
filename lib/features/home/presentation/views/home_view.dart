import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/coupons_list_view_for_home.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/sliders_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: const Column(
        children: [
          SlidersListView(),
          CategoriesListView(),
          CouponsListViewForHome()
        ],
      ),
    );
  }
}