
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget customHeader(){
  return Opacity(
      opacity: .4,
      child: Image.asset("assets/header.png"));
}

Widget appLogo({required String imagePath}) {
  return Image.asset(
    imagePath,
    height: 21.h,
    width: double.infinity,
  );
}

Widget welcomeText({required String text}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 20.sp, fontWeight: FontWeight.w500, color: primaryColor),
  );
}

Widget customTextFieldRow({
  required String iconTextField,
  required Widget textField,
}) {
  return Row(
    children: [
      Image.asset(
        iconTextField,
      ),
      SizedBox(width: 2.w),
      Expanded(
        child: textField,
      ),
    ],
  );
}

Widget forgotPassword({required Widget navToScreen,required BuildContext context}) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (
                BuildContext context) => navToScreen
        ),
      );
    },
    child: Container(
      padding:const EdgeInsets.all(10),
      alignment:Alignment.centerRight,
      child: Text(
        'Forgot Password ?',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff8A8A8A),

        ),
      ),
    ),
  );
}

Widget accountOption({required Widget navToScreen,required BuildContext context,required String question,required String option}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        question,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w800,
          color: primaryColor,

        ),
      ),
      GestureDetector(
        onTap: (){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (
                    BuildContext context) => navToScreen
            ),
                (route) => false,
          );
        },
        child: Text(
          option,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: secondaryColor,

          ),
        ),
      ),
    ],
  );
}

navToScreen(context,{required Widget navToScreen}){
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (
            BuildContext context) => navToScreen
    ),
  );
}
