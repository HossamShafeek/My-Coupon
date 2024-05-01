import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/features/authentication/data/models/authentication_model.dart';
import 'package:my_coupon/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:my_coupon/features/home/data/models/report_model/report_model.dart';
import 'package:my_coupon/features/home/data/repository/home_repository.dart';
import 'package:my_coupon/features/home/presentation/cubits/details_buttons_cubit/details_buttons_state.dart';
import 'package:share_plus/share_plus.dart';

class DetailsButtonsCubit extends Cubit<DetailsButtonsState> {
  DetailsButtonsCubit(this.homeRepository) : super(DetailsButtonsInitial());

  final HomeRepository homeRepository;

  TextEditingController reportContentController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Future<void> sendReportOnCoupon({
    required CouponModel couponModel,
    required AuthenticationModel authenticationModel,
  }) async {
    emit(ReportLoadingState());
    Either<Failure, String> result;
    result = await homeRepository.sentReportOnCoupon(
      reportModel: ReportModel(
        firstName: authenticationModel.firstName,
        lastName: authenticationModel.lastName,
        userId: AppConstants.userId,
        reportContent: reportContentController.text,
        couponId: couponModel.id,
        email: authenticationModel.email,
      ),
    );
    result.fold((failure) {
      emit(ReportFailureState(failure.error));
    }, (categories) {
      emit(ReportSuccessState(categories));
    });
  }

  static DetailsButtonsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void saveCouponCodeToClipboard({required String couponCode}) {
    Clipboard.setData(ClipboardData(text: couponCode));
    emit(CopyCouponCodeState('تم نسخ كود الكوبون بنجاح'));
  }

  void shareCoupon({required String storeUrl}) {
    Share.share(storeUrl);
  }

  void launchStoreUrl({required String storeUrl}) async {
    final Uri uri = Uri.parse(storeUrl);
    try {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } catch (error) {
      emit(CanNotLaunchUrl('يوجد مشكلة في رابط المتجر'));
    }
  }
}
