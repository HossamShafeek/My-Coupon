import 'package:dartz/dartz.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/home/data/models/categories_model/categories_model.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/data/models/report_model/report_model.dart';
import 'package:my_coupon/features/home/data/models/slider_model/slider_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<OfferModel>>> getSliders();

  Future<Either<Failure, List<OfferModel>>> getOffers();

  Future<Either<Failure, List<CategoryModel>>> getCategories();

  Future<Either<Failure, List<CouponModel>>> getCoupons();

  Future<Either<Failure, String>> sentReportOnCoupon(
      {required ReportModel reportModel}
      );

}
