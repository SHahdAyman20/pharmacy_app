import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOutlinedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: secondaryColor), // Specify the outline border color
          backgroundColor: Colors.white, // Specify the background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 13.sp, horizontal: 25.sp),
          child: Text(
            text,
            style: TextStyle(
              color: secondaryColor, // Specify the text color to match the outline border color
              fontSize: 19.sp,
            ),
          ),
        ),
      ),
    );
  }
}