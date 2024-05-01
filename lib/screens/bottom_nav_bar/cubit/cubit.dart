import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/screens/bottom_nav_bar/cubit/state.dart';
import 'package:pharmacy_app/screens/call_us_screen/call_us_screen.dart';
import 'package:pharmacy_app/screens/categories_screen/categories_screen.dart';
import 'package:pharmacy_app/screens/home_screen/home_screen.dart';
import 'package:pharmacy_app/screens/my_cart_screen/my_cart_screen.dart';
import 'package:pharmacy_app/screens/profile_screen/profile_screen.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarStates> {
  BottomNavBarCubit() : super(LayoutInitialState());

  int bottomNavIndex = 0;

  void changeBottomNavIndex({required int currentIndex}) {
    bottomNavIndex = currentIndex;
    emit(ChangeBottomNavigationIndexState());
  }

  List<Widget> layoutScreens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CallUsScreen(),
    const MyCartScreen(),
    const ProfileScreen()
  ];
}