import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/authentication/data/repository/authentication_repository.dart';
import 'package:my_coupon/features/authentication/presentation/cubits/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authenticationRepository) : super(LoginInitialState());

  final AuthenticationRepository authenticationRepository;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(LoginChangePasswordVisibilityState());
  }
  late User user;

  void loginWithEmailAndPassword() async {
    emit(LoginLoadingState());
    Either<Failure, User> result =
    await authenticationRepository.loginWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((failure) {
      emit(LoginFailureState(failure.error));
    }, (user) {
      this.user = user;
      emit(LoginSuccessState(user));
    });
  }
}
