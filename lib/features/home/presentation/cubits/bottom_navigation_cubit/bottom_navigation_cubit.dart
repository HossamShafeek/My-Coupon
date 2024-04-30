import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_coupon/config/icons/icons_broken.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/features/favorites/presentation/view/favorites_view.dart';
import 'package:my_coupon/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:my_coupon/features/clipboard/presentation/views/clipboard_view.dart';
import 'package:my_coupon/features/home/presentation/views/home_view.dart';
import 'package:my_coupon/features/menu/presentation/views/menu_view.dart';
import 'package:my_coupon/features/home/presentation/views/offers_view.dart';



class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitialState());

  static BottomNavigationCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;

  void changeBottomNavigation(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationState());
  }

  List<Widget> bodyScreens = const [
    MenuView(),
    FavoritesView(),
    HomeView(),
    OffersView(),
    ClipboardView(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Filter,
      ),
      label: AppStrings.menu,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Heart,
      ),
      label: AppStrings.favorites,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Home,
      ),
      label: AppStrings.home,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Discount,
      ),
      label: AppStrings.offers,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Wallet,
      ),
      label: AppStrings.clipboard,
    ),
  ];
}
