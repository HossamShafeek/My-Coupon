import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/animations/page_fade_transition.dart';
import 'package:my_coupon/core/animations/page_slide_transition.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/service_locator.dart';
import 'package:my_coupon/features/authentication/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:my_coupon/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:my_coupon/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:my_coupon/features/authentication/presentation/views/forgot_password_view.dart';
import 'package:my_coupon/features/authentication/presentation/views/login_view.dart';
import 'package:my_coupon/features/authentication/presentation/views/register_view.dart';
import 'package:my_coupon/features/home/data/models/categories_model/categories_model.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:my_coupon/features/home/presentation/views/all_offers_view.dart';
import 'package:my_coupon/features/home/presentation/views/categories_view.dart';
import 'package:my_coupon/features/home/presentation/views/coupon_details_view.dart';
import 'package:my_coupon/features/home/presentation/views/coupons_view.dart';
import 'package:my_coupon/features/home/presentation/views/layout_view.dart';
import 'package:my_coupon/features/splash/presentation/views/splash_view.dart';


class VerificationViewParams {
  final String verificationId;
  final String phone;

  VerificationViewParams({required this.verificationId, required this.phone});
}

class Routes {
  static const String slashView = '/';
  static const String loginView = '/login_view';
  static const String registerView = '/register_view';
  static const String forgotPassword = '/forgot_password_view';
  static const String layoutView = '/layout_view';
  static const String categoriesView = '/categories_view';
  static const String couponsView = '/coupons_view';
  static const String couponDetailsView = '/coupon_details_view';
  static const String allOffersView = '/all_offers_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.slashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.loginView:
        return PageFadeTransition(
          page:  BlocProvider(
              create: (context) => getIt.get<LoginCubit>(),
              child: const LoginView()),
        );
        case Routes.registerView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page:  BlocProvider(
              create: (context) => getIt.get<RegisterCubit>(),
              child: const RegisterView()),
        );
        case Routes.forgotPassword:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page:  BlocProvider(
              create: (context) => getIt.get<ForgotPasswordCubit>(),
              child: const ForgotPasswordView()),
        );
      case Routes.layoutView:
        return PageFadeTransition(
          page:  MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt.get<BottomNavigationCubit>(),),
                BlocProvider(create: (context) => getIt.get<SlidersCubit>(),),
              ],
              child: const LayoutView()),
        );
      case Routes.categoriesView:
        final categories = settings.arguments as List<CategoryModel>;
        return PageSlideTransition(
          direction: AxisDirection.right,
          page:   CategoriesView(categories: categories),
        );
        case Routes.couponsView:
        final categoryName = settings.arguments as String;
        return PageSlideTransition(
          direction: AxisDirection.right,
          page:   CouponsView(categoryName: categoryName),
        );
        case Routes.allOffersView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page:   const AllOffersView(),
        );
        case Routes.couponDetailsView:
          final coupon = settings.arguments as CouponModel;
        return PageSlideTransition(
          direction: AxisDirection.right,
          page:    CouponDetailsView(couponModel: coupon),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
