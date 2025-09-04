import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'OnboardingScreen.dart';
import 'utils/AppColors.dart';  // Make sure to import your AppColors

class Splash_Sceen extends StatefulWidget {
  const Splash_Sceen({super.key});

  @override
  State<Splash_Sceen> createState() => _Splash_SceenState();
}

class _Splash_SceenState extends State<Splash_Sceen> {
  // Add the onboarding check function
  Future<bool> checkOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isOnboardingScreen') ?? false;
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      // Check onboarding status after splash delay
      bool isOnboardingCompleted = await checkOnboarding();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isOnboardingCompleted ? HomePage() : OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.splash_color,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/icons/ic_logo.png",
                color: Colors.white,
              ),
              SizedBox(width: 10.w),
              Text(
                "Grocery",
                style: TextStyle(
                  fontSize: 44.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}