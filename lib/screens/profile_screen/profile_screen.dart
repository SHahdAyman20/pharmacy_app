import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/screens/profile_screen/widgets/app_bar_widget.dart';
import 'package:pharmacy_app/screens/profile_screen/widgets/profile_body_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../home_screen/widgets/home_body_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        flexibleSpace:  const AppBarWidget(),
        backgroundColor:backgroundColor ,
        elevation: 0,
        toolbarHeight: 22.h,
        foregroundColor: primaryColor,
        leading: searchIconWidget(),
      ),
      body: const ProfileScreenBody(),
    );
  }
}
