import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_coupon/config/routes/app_routes.dart';
import 'package:my_coupon/config/themes/app_theme.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/utils/service_locator.dart';
import 'package:my_coupon/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:my_coupon/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'features/clipboard/presentation/cubits/clipboard_cubit/clipboard_cubit.dart';

class MyCoupon extends StatelessWidget {
  const MyCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers:[
            BlocProvider(create: (context) => getIt.get<FavoritesCubit>(),),
            BlocProvider(create: (context) => getIt.get<ClipboardCubit>(),),
            BlocProvider(create: (context) => getIt.get<OffersCubit>(),),
            BlocProvider(create: (context) => getIt.get<CategoriesCubit>(),),
            BlocProvider(create: (context) => getIt.get<CouponsCubit>(),),
            BlocProvider(create: (context) => getIt.get<ProfileCubit>(),),
          ],
          child: MaterialApp(
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
            title: AppStrings.myCoupon,
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        );
      },
    );
  }
}
