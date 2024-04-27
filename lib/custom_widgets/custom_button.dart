import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 13.sp,horizontal: 25.sp),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.sp
          ),
        ),
      ),

    );
  }
}