import 'package:flutter/material.dart';
import 'package:pharmacy_app/screens/splash_screen/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pharmacy app',
          home:  SplashScreen(),
        );
      },
    );
  }
}
