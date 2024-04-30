import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_coupon/config/routes/app_routes.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/features/splash/presentation/views/widgets/splash_view_body.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateToOnBoardingView();
    super.initState();
  }

  void navigateToOnBoardingView() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
     if(AppConstants.userId.isEmpty){
       Navigator.pushReplacementNamed(context, Routes.loginView);
     }else{
       Navigator.pushReplacementNamed(context, Routes.layoutView);
     }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppConstants.systemUiOverlayStyleDark,
        child: SplashViewBody(),
      ),
    );
  }
}
