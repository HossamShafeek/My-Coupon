import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_coupon/core/widgets/logo_text_widget.dart';
import 'package:my_coupon/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:my_coupon/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:my_coupon/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    SlidersCubit.get(context).getSliders();
    CategoriesCubit.get(context).getCategories();
    CouponsCubit.get(context).getCoupons();
    OffersCubit.get(context).getOffers();
    ProfileCubit.get(context).getUserData();
    FavoritesCubit.get(context).getFavorites();
    BottomNavigationCubit.get(context).currentIndex=2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: false,
            title: LogoTextWidget(
              size: 100.h,
            ),
          ),
          body: BottomNavigationCubit.get(context)
              .bodyScreens[BottomNavigationCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              BottomNavigationCubit.get(context).changeBottomNavigation(index);
            },
            currentIndex: BottomNavigationCubit.get(context).currentIndex,
            items: BottomNavigationCubit.get(context).bottomNavigationBarItems,
          ),
        );
      },
    );
  }
}
