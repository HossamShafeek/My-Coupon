import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_coupon/config/local/cache_helper.dart';
import 'package:my_coupon/core/utils/app_constants.dart';
import 'package:my_coupon/core/utils/service_locator.dart';
import 'package:my_coupon/firebase_options.dart';
import 'package:my_coupon/my_coupon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
   setupServiceLocator();
   await CacheHelper.init();
   AppConstants.userId = CacheHelper.getString(key: 'userId') ?? '';
  runApp(const MyCoupon());
}
