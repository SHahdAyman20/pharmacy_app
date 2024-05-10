import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/screens/home_screen/api_handling/home_cubit/home_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'body_shopping_cart.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return  Scaffold(
      backgroundColor: backgroundColor,
      appBar:  AppBar(
        foregroundColor: primaryColor,
          backgroundColor: whiteColor,
          leading: BackButton(
            onPressed: (){
              cubit.productNum = 1;
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text("My Shopping Cart"
            ,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600
            ),)
      ),
      body: const BodyShoppingScreen(),

    );

  }
}
