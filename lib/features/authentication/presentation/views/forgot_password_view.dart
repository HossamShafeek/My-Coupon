import 'package:flutter/material.dart';
import 'package:my_coupon/features/authentication/presentation/views/widgets/forgot_password_view_body.dart';


class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ForgotPasswordViewBody(),

    );
  }
}