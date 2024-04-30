import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/offers_list_view_for_home.dart';
import 'package:my_coupon/features/home/presentation/views/widgets/sliders_list_view.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConstants.defaultPadding,
        right: AppConstants.defaultPadding,
        top: AppConstants.defaultPadding,
      ),
      child: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SlidersListView(),
            OffersListViewForHome(),
          ],
        ),
      ),
    );
  }
}

