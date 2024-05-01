import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/home/data/models/categories_model/categories_model.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/data/models/report_model/report_model.dart';
import 'package:my_coupon/features/home/data/models/slider_model/slider_model.dart';
import 'package:my_coupon/features/home/data/repository/home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<OfferModel>>> getSliders() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('Sliders').get();
      List<OfferModel> banners = result.docs.map((banner) {
        return OfferModel.fromJson(banner.data());
      }).toList();
      return Right(banners);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OfferModel>>> getOffers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('Offers').get();
      List<OfferModel> offers = result.docs.map((banner) {
        return OfferModel.fromJson(banner.data());
      }).toList();
      return Right(offers);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('Categories').get();
      List<CategoryModel> categories = result.docs.map((category) {
        return CategoryModel.fromJson(category.data());
      }).toList();
      return Right(categories);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CouponModel>>> getCoupons() async{
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('Coupons').get();
      List<CouponModel> coupons = result.docs.map((coupon) {
        return CouponModel.fromJson(coupon.data());
      }).toList();
      return Right(coupons);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> sentReportOnCoupon({
    required ReportModel reportModel,
}) async{
    try {
      await firebaseFirestore.collection('Reports').doc().set(reportModel.toJson());
      return const Right('تم إرسال بلاغك بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
