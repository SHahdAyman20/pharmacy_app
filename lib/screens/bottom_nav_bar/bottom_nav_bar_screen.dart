import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/screens/bottom_nav_bar/cubit/cubit.dart';
import 'package:pharmacy_app/screens/bottom_nav_bar/cubit/state.dart';
class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BottomNavBarCubit>(context);
    return BlocConsumer<BottomNavBarCubit,BottomNavBarStates>(
        listener: (context,state)
        {

        },
        builder: (context,state){
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              currentIndex: BlocProvider.of<BottomNavBarCubit>(context).bottomNavIndex,
              onTap: (currentIndex)
              {
                debugPrint("Current index is : $currentIndex");
                BlocProvider.of<BottomNavBarCubit>(context).changeBottomNavIndex(currentIndex: currentIndex);
              },
              items:
              const
              [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
                BottomNavigationBarItem(icon: Icon(Icons.person_pin_outlined),label: "Call Us"),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "My Cart"),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
              ],
            ),
            body: cubit.layoutScreens[cubit.bottomNavIndex],
          );
        }
    );
  }
}