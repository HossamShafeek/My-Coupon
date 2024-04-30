import 'package:dartz/dartz.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';


abstract class ClipboardRepository {
  Future<Either<Failure, String>> addCouponToFireStore({
    required CouponModel couponModel,
  });
  Future<Either<Failure, String>> updateCouponFromFireStore({
    required CouponModel couponModel,
    required String couponId,
  });
  Future<Either<Failure, String>> deleteCouponFromFireStore({
    required String couponId,
  });
}
