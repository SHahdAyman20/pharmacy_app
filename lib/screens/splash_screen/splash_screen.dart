import 'package:animate_do/animate_do.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/screens/login_screen/login_screen.dart';
import 'package:pharmacy_app/screens/option_for_home_or_login/option_for_home_or_login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
   const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        backgroundColor: backgroundColor,
        duration:const Duration(seconds: 3),
        splashScreenBody: Center(
          child: FadeIn(
            duration: const Duration(seconds: 2),
            child: Image.asset(
              'assets/logoooo.png',
              height: 200.h,
              width: double.infinity,
            ),
          ),
        ),
        nextScreen: const OptionForLoginOrHomeScreen(),
      ),
    );
  }
}