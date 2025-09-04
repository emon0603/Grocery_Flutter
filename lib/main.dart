import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries/HomePage.dart';
import 'package:groceries/LoginRegister/LoginPage.dart';
import 'package:groceries/Pages/Explore.dart';
import 'package:groceries/others/DetailsProduct.dart';

import 'Splash_Sceen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896), // আপনার ডিজাইন এর মূল সাইজ (iPhone X এর মতো)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: Loginpage(),
    );
  }
}
