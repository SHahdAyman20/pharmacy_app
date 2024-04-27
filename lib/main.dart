import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/localization/lang_cubit/cubit.dart';
import 'package:pharmacy_app/screens/home_screen/api_handling/user_cubit/user_cubit.dart';
import 'package:pharmacy_app/screens/login_screen/login_api/login_cubit.dart';
import 'package:pharmacy_app/screens/register_screen/register_api/register_cubit.dart';
import 'package:pharmacy_app/screens/splash_screen/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'const/blockobserver/blockobserver.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Add this line

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return  MultiBlocProvider(providers: [
          BlocProvider(create: (context)=>LanguageCubit()),
          BlocProvider(create: (context)=>RegisterCubit()),
          BlocProvider(create: (context)=>LoginCubit()),
          BlocProvider(create: (context)=>UserDateCubit()..getUserData()),

        ], child: MaterialApp(
          localizationsDelegates: const [
            // AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
          ],
          locale: PlatformDispatcher.instance.locale,
          debugShowCheckedModeBanner: false,
          title: 'Pharmacy app',
          home:  const SplashScreen(),
        ));
      },
    );
  }
}
