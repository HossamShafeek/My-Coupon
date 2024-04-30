import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_coupon/config/local/cache_helper.dart';
import 'package:my_coupon/config/routes/app_routes.dart';
import 'package:my_coupon/core/functions/show_snack_bar.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/app_strings.dart';
import 'package:my_coupon/core/widgets/custom_elevated_button.dart';
import 'package:my_coupon/core/widgets/logo_text_widget.dart';
import 'package:my_coupon/core/widgets/title_and_text_button.dart';
import 'package:my_coupon/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:my_coupon/features/authentication/presentation/cubits/login_cubit/login_state.dart';
import 'package:my_coupon/features/authentication/presentation/views/widgets/login_texts_fields_section.dart';
import 'package:my_coupon/features/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }else if (state is LoginSuccessState) {
          CacheHelper.setString(key: 'userId', value: state.user.uid);
          AppConstants.userId = state.user.uid;
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.layoutView, (route) => false);
          showSuccessSnackBar(
              context: context, message: 'تم تسجيل الدخول بنجاح');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(AppConstants.size30h),
                    const Center(child: LogoTextWidget()),
                    const Gap(50),

                    const TitleAndSubtitle(
                      subtitle: AppStrings.signInSubtitle,
                      title: AppStrings.signIn,
                    ),
                    const LoginTextsFieldsSection(),
                    TitleAndTextButton(
                      title: AppStrings.didYouForgetYourPassword,
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.forgotPassword);
                      },
                      titleForButton: AppStrings.resetPassword,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        if (LoginCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          LoginCubit.get(context).loginWithEmailAndPassword();
                        }
                      },
                      title: AppStrings.signIn,
                    ),
                    TitleAndTextButton(
                      title: AppStrings.doNotHaveAnAccount,
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.registerView);
                      },
                      titleForButton: AppStrings.createNewAccount,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
