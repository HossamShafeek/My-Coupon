
import 'package:my_coupon/features/home/data/models/slider_model/slider_model.dart';

abstract class SlidersState {}

final class SlidersInitialState extends SlidersState {}

class SlidersLoadingState extends SlidersState {}

class SlidersSuccessState extends SlidersState {
  final List<OfferModel> sliders;

  SlidersSuccessState(this.sliders);
}

class SlidersFailureState extends SlidersState {
  final String error;

  SlidersFailureState(this.error);
}

class ChangeSliderIndexState extends SlidersState{}