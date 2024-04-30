import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/clipboard/data/repository/clipboard_repository.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';

class ClipboardRepositoryImplementation extends ClipboardRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, String>> addCouponToFireStore({
    required CouponModel couponModel,
  }) async {
    try {
      await firebaseFirestore
          .collection('Coupons')
          .add(couponModel.toJson())
          .then((value) async {
        await firebaseFirestore
            .collection('Coupons')
            .doc(value.id)
            .update({'id': value.id});
      });
      return const Right('تم إضافة كوبونك بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateCouponFromFireStore({
    required CouponModel couponModel,
    required String couponId,
  }) async {
    try {
      await firebaseFirestore
          .collection('Coupons')
          .doc(couponId)
          .update(couponModel.toJson());
      return const Right('تم تعديل كوبونك بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCouponFromFireStore({
    required String couponId,
  }) async {
    try {
      await firebaseFirestore.collection('Coupons').doc(couponId).delete();
      return const Right('تم حذف كوبونك بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
