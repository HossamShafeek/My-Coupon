import 'package:get_it/get_it.dart';
import 'package:my_coupon/features/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:my_coupon/features/authentication/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:my_coupon/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:my_coupon/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:my_coupon/features/clipboard/data/repository/clipboard_repository_implementation.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_cubit.dart';
import 'package:my_coupon/features/favorites/data/repository/favorites_repository_implementation.dart';
import 'package:my_coupon/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:my_coupon/features/home/data/repository/home_repository_implementation.dart';
import 'package:my_coupon/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:my_coupon/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:my_coupon/features/menu/data/repository/menu_repository_implementation.dart';
import 'package:my_coupon/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //Auth Repo ( Login Cubit - Register Cubit)
  getIt.registerSingleton<AuthenticationRepositoryImplementation>(
      AuthenticationRepositoryImplementation());
  getIt.registerFactory(() =>
      LoginCubit(getIt.get<AuthenticationRepositoryImplementation>()));
  getIt.registerFactory(() =>
      RegisterCubit(getIt.get<AuthenticationRepositoryImplementation>()));
  getIt.registerFactory(() =>
      ForgotPasswordCubit(getIt.get<AuthenticationRepositoryImplementation>()));
  //Bottom Nav Bar Cubit
  getIt.registerFactory(() => BottomNavigationCubit());
  //Home Repo ( Sliders Cubit - Categories Cubit - Coupons Cubit )
  getIt.registerSingleton<HomeRepositoryImplementation>(
      HomeRepositoryImplementation());
  getIt.registerFactory(
      () => SlidersCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
      () => OffersCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
      () => CategoriesCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
      () => CouponsCubit(getIt.get<HomeRepositoryImplementation>()));
  //Menu Repo ( Profile Cubit )
  getIt.registerSingleton<MenuRepositoryImplementation>(
    MenuRepositoryImplementation()
  );
  //Menu Repo ( Profile Cubit )
  getIt.registerFactory(
      () => ProfileCubit(getIt.get<MenuRepositoryImplementation>()));
  // //Favourites Repo ( Favourites Cubit )
  getIt.registerSingleton(FavoritesRepositoryImplementation());
  getIt.registerFactory(
          () => FavoritesCubit(getIt.get<FavoritesRepositoryImplementation>()));
  //Clipboard Repo ( Clipboard Cubit )
  getIt.registerSingleton(ClipboardRepositoryImplementation());
  getIt.registerFactory(
          () => ClipboardCubit(getIt.get<ClipboardRepositoryImplementation>()));
}