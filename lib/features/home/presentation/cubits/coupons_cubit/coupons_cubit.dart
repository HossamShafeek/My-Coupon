import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/data/repository/home_repository.dart';
import 'package:my_coupon/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';

class CouponsCubit extends Cubit<CouponsState> {
  CouponsCubit(this.homeRepository) : super(CouponsInitial());
  final HomeRepository homeRepository;

  static CouponsCubit get(context) => BlocProvider.of(context);

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<CouponModel> coupons = [];

  Future<void> getCoupons() async {
    emit(CouponsLoadingState());
    Either<Failure, List<CouponModel>> result;
    result = await homeRepository.getCoupons();
    result.fold((failure) {
      emit(CouponsFailureState(failure.error));
    }, (coupons) {
      this.coupons = coupons;
      emit(CouponsSuccessState(coupons));
    });
  }

  List<CouponModel> couponsByCategoryName = [];

  void getCouponsByCategoryName({required String categoryName}) {
    couponsByCategoryName=[];
    if (categoryName == 'الكل') {
      couponsByCategoryName = coupons;
    } else {
      coupons.map(
            (coupon) {
          if (coupon.categoryName == categoryName) {
            couponsByCategoryName.add(coupon);
          }
        },
      ).toList();
    }
  }

  List<CouponModel> searchedCouponsList = [];

  void getSearchedCouponsList({required String companyName}) {
      searchedCouponsList = couponsByCategoryName.where((element) {
        return element.companyName.contains(companyName);
      }).toList();
      emit(GetSearchedCouponsList());

  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    isSearching = true;
    emit(CouponsChangeIsSearchingState());
  }

  void stopSearch() {
    _clearSearch();
    isSearching = false;
    emit(CouponsChangeIsSearchingState());
  }

  void _clearSearch() {
    searchController.clear();
    emit(CouponsChangeIsSearchingState());
  }
}
