import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/home/data/models/categories_model/categories_model.dart';
import 'package:my_coupon/features/home/data/repository/home_repository.dart';
import 'package:my_coupon/features/home/presentation/cubits/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepository) : super(CategoriesInitial());
  final HomeRepository homeRepository;

  static CategoriesCubit get(context) => BlocProvider.of(context);

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    Either<Failure, List<CategoryModel>> result;
    result = await homeRepository.getCategories();
    result.fold((failure) {
      emit(CategoriesFailureState(failure.error));
    }, (categories) {
      emit(CategoriesSuccessState(categories));
    });
  }
}
