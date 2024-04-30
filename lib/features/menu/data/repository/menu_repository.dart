import 'package:dartz/dartz.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/authentication/data/models/authentication_model.dart';

abstract class MenuRepository {
  Future<Either<Failure, AuthenticationModel>> getUserData({
    required String userId,
  });
  Future<Either<Failure, String>> updateUserData({
    required String userId,
    required String firstName,
    required String lastName,
  });
}
