import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';

abstract class CouponsState {}

final class CouponsInitial extends CouponsState {}

class CouponsLoadingState extends CouponsState {}

class CouponsSuccessState extends CouponsState {
  final List<CouponModel> coupons;

  CouponsSuccessState(this.coupons);
}

class CouponsFailureState extends CouponsState {
  final String error;

  CouponsFailureState(this.error);
}

class GetSearchedCouponsList extends CouponsState {}

class CouponsChangeIsSearchingState extends CouponsState {}

