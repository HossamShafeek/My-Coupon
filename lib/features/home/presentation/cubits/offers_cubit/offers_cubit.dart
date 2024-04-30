import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/home/data/models/slider_model/slider_model.dart';
import 'package:my_coupon/features/home/data/repository/home_repository.dart';
import 'package:my_coupon/features/home/presentation/cubits/offers_cubit/offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this.homeRepository) : super(OffersInitialState());
  final HomeRepository homeRepository;

  static OffersCubit get(context) => BlocProvider.of(context);

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<OfferModel> offers = [];

  Future<void> getOffers() async {
    emit(OffersLoadingState());
    Either<Failure, List<OfferModel>> result;
    result = await homeRepository.getOffers();
    result.fold((failure) {
      emit(OffersFailureState(failure.error));
    }, (offers) {
      this.offers = offers;
      emit(OffersSuccessState(offers));
    });
  }

  List<OfferModel> searchedOffersList = [];

  void getSearchedOffersList({required String companyName}) {
    searchedOffersList = offers.where((element) {
      return element.companyName.contains(companyName);
    }).toList();

    emit(GetSearchedOffersList());
  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    isSearching = true;
    emit(OffersChangeIsSearchingState());
  }

  void stopSearch() {
    _clearSearch();
    isSearching = false;
    emit(OffersChangeIsSearchingState());
  }

  void _clearSearch() {
    searchController.clear();
    emit(OffersChangeIsSearchingState());
  }
}
