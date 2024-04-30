import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/features/clipboard/data/repository/clipboard_repository.dart';
import 'package:my_coupon/features/clipboard/presentation/cubits/clipboard_cubit/clipboard_state.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';

class ClipboardCubit extends Cubit<ClipboardState> {
  ClipboardCubit(this.clipboardRepository) : super(ClipboardInitialState());
  final ClipboardRepository clipboardRepository;

  TextEditingController companyNameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController storeUrlController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  String? categoryDropdownValue;

  static ClipboardCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> addCouponToFireStore() async {
    emit(AddCouponLoadingState());
    Either<Failure, String> result =
        await clipboardRepository.addCouponToFireStore(
      couponModel: CouponModel(
        companyName: companyNameController.text,
        title: titleController.text,
        storeUrl: storeUrlController.text,
        imageUrl: imageUrlController.text,
        categoryName: categoryDropdownValue!,
        expirationDate: expirationDateController.text,
        description: descriptionController.text,
        code: codeController.text,
        userId: AppConstants.userId,
        id: '',
      ),
    );
    result.fold((failure) {
      emit(AddCouponFailureState(failure.error));
    }, (message) {
      emit(AddCouponSuccessState(message));
    });
  }

  Future<void> updateCouponFromFireStore({required String couponId }) async {
    emit(UpdateCouponLoadingState());
    Either<Failure, String> result =
    await clipboardRepository.updateCouponFromFireStore(
      couponId: couponId,
      couponModel: CouponModel(
        companyName: companyNameController.text,
        title: titleController.text,
        storeUrl: storeUrlController.text,
        imageUrl: imageUrlController.text,
        categoryName: categoryDropdownValue!,
        expirationDate: expirationDateController.text,
        description: descriptionController.text,
        code: codeController.text,
        userId: AppConstants.userId,
        id: couponId,
      ),
    );
    result.fold((failure) {
      emit(UpdateCouponFailureState(failure.error));
    }, (message) {
      emit(UpdateCouponSuccessState(message));
    });
  }

  Future<void> deleteCouponFromFireStore({required String couponId }) async {
    emit(DeleteCouponLoadingState());
    Either<Failure, String> result =
    await clipboardRepository.deleteCouponFromFireStore(
      couponId: couponId,
    );
    result.fold((failure) {
      emit(DeleteCouponFailureState(failure.error));
    }, (message) {
      emit(DeleteCouponSuccessState(message));
    });
  }

  List<CouponModel> clipboardCoupons = [];

  void getClipboardCoupons({required List<CouponModel> coupons}) {
    clipboardCoupons = [];
    coupons.map((coupon) {
      if (coupon.userId == AppConstants.userId) {
        clipboardCoupons.add(coupon);
      }
    }).toList();
    emit(GetClipboardCouponsState());
  }
}
