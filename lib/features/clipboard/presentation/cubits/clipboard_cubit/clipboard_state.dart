abstract class ClipboardState {}

class ClipboardInitialState extends ClipboardState {}

class AddCouponLoadingState extends ClipboardState {}

class AddCouponSuccessState extends ClipboardState {
  final String message;

  AddCouponSuccessState(this.message);
}

class AddCouponFailureState extends ClipboardState {
  final String error;

  AddCouponFailureState(this.error);
}

class UpdateCouponLoadingState extends ClipboardState {}

class UpdateCouponSuccessState extends ClipboardState {
  final String message;

  UpdateCouponSuccessState(this.message);
}

class UpdateCouponFailureState extends ClipboardState {
  final String error;

  UpdateCouponFailureState(this.error);
}

class DeleteCouponLoadingState extends ClipboardState {}

class DeleteCouponSuccessState extends ClipboardState {
  final String message;

  DeleteCouponSuccessState(this.message);
}

class DeleteCouponFailureState extends ClipboardState {
  final String error;

  DeleteCouponFailureState(this.error);
}

class GetClipboardCouponsState extends ClipboardState {}

class GetSearchedCouponsList extends ClipboardState {}