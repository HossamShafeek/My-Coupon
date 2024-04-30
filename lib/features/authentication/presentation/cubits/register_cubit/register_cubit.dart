import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coupon/core/errors/failures.dart';
import 'package:my_coupon/features/authentication/data/models/authentication_model.dart';
import 'package:my_coupon/features/authentication/data/repository/authentication_repository.dart';
import 'package:my_coupon/features/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authenticationRepository) : super(RegisterInitialState());

  final AuthenticationRepository authenticationRepository;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(RegisterChangePasswordVisibilityState());
  }

  late User user;

  Future<void> registerWithEmailAndPassword() async {
    emit(RegisterLoadingState());
    Either<Failure, User> result =
    await authenticationRepository.registerWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((failure) {
      emit(RegisterFailureState(failure.error));
    }, (user) {
      this.user = user;
      saveUserDataToFirebase();
      emit(RegisterSuccessState(user));
    });
  }


  Future<void> saveUserDataToFirebase() async {
    emit(SaveUserDataLoadingState());
    Either<Failure, String> result =
    await authenticationRepository.saveUserDataToFirebase(
      authenticationModel: AuthenticationModel(
          uid: user.uid,
          email: user.email!,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          createAt: Timestamp.now()),
    );
    result.fold((failure) {
      emit(SaveUserDataFailureState(failure.error));
    }, (message) {
      emit(SaveUserDataSuccessState(message: message));
    });
  }
}
