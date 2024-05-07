import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/custom_widgets/custom_elevated_button.dart';
import 'package:pharmacy_app/custom_widgets/custom_gradiant.dart';
import 'package:pharmacy_app/custom_widgets/custom_outlined_button.dart';
import 'package:pharmacy_app/custom_widgets/custom_widgets.dart';
import 'package:pharmacy_app/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:pharmacy_app/screens/home_screen/home_screen.dart';
import 'package:pharmacy_app/screens/login_screen/login_screen.dart';
import 'package:pharmacy_app/screens/register_screen/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OptionForLoginOrHomeScreen extends StatelessWidget {
  const OptionForLoginOrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: CustomGradient().buildGradientDecoration(),
        child: ListView(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/amico.png',
                  height: 40.h,
                  width: 70.w,
                ),
                Text(
                  'Hello!',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  'Order your medications and much more from the comfort of your home with our pharmacy app',
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                    color: primaryColor
                  ),
                ),
                SizedBox(height: 2.h,),
                CustomElevatedButton(
                    text: 'Start Now!',
                    onPressed: (){
                      navToScreen(context, navToScreen:const  BottomNavBarScreen());
                    }
                ),
                SizedBox(height: 1.h,),
                CustomOutlinedButton(
                  text: 'Sign Up ',
                  onPressed: (){
                  navToScreen(context, navToScreen:const  RegisterScreen());
                },),
              ],
            )
          ],
        ),
      ),
    );
  }
}
