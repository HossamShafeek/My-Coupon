import 'package:dartz/dartz.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<CouponModel>>> getFavorites({
    required String userId,
  });

  Future<Either<Failure, String>> addToFavorites({
    required String userId,
    required CouponModel couponModel,
  });

  Future<Either<Failure, String>> removeToFavorites({
    required String couponId,
    required String userId,
  });
}
