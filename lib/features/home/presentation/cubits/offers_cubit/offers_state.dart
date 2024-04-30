
import 'package:my_coupon/features/home/data/models/slider_model/slider_model.dart';

abstract class OffersState {}

final class OffersInitialState extends OffersState {}

class OffersLoadingState extends OffersState {}

class OffersSuccessState extends OffersState {
  final List<OfferModel> offers;

  OffersSuccessState(this.offers);
}

class OffersFailureState extends OffersState {
  final String error;

  OffersFailureState(this.error);
}

class GetSearchedOffersList extends OffersState {}

class OffersChangeIsSearchingState extends OffersState {}
