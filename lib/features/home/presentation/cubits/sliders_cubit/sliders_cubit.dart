import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/home/data/models/slider_model/slider_model.dart';
import 'package:my_coupon/features/home/data/repository/home_repository.dart';
import 'package:my_coupon/features/home/presentation/cubits/sliders_cubit/sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit(this.homeRepository) : super(SlidersInitialState());
  final HomeRepository homeRepository;

  static SlidersCubit get(context) => BlocProvider.of(context);

  List<OfferModel> sliders=[];

  Future<void> getSliders() async {
    emit(SlidersLoadingState());
    Either<Failure, List<OfferModel>> result;
    result = await homeRepository.getSliders();
    result.fold((failure) {
      emit(SlidersFailureState(failure.error));
    }, (sliders) {
      this.sliders =sliders;
      emit(SlidersSuccessState(sliders));
    });
  }

  int currentIndex = 0;

  void changeSliderIndex({required int index}){
    currentIndex = index;
    emit(ChangeSliderIndexState());
  }

}