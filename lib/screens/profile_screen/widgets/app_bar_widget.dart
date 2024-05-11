import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:  BoxDecoration(
              color: whiteColor,
              border: Border.all(color: brownColor),
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))
          ),
        ),
        Align(
         alignment: Alignment.bottomCenter,
         child:  CircleAvatar(
           backgroundColor: backgroundColor,
           radius: 33.sp,
         ),
       )
      ],
    );
  }
}
