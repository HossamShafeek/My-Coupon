abstract class DetailsButtonsState {}

final class DetailsButtonsInitial extends DetailsButtonsState {}

class CopyCouponCodeState extends DetailsButtonsState {
  final String message;

  CopyCouponCodeState(this.message);
}
class ReportLoadingState extends DetailsButtonsState {}

class CanNotLaunchUrl extends DetailsButtonsState {
  final String error;

  CanNotLaunchUrl(this.error);
}

class ReportSuccessState extends DetailsButtonsState {
  final String message;

  ReportSuccessState(this.message);
}

class ReportFailureState extends DetailsButtonsState {
  final String error;

  ReportFailureState(this.error);
}