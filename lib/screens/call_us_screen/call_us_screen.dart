import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CallUsScreen extends StatelessWidget {
  const CallUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding:const EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height:10.h,),
            Text(
              'If you need quick advice,\nfeel free to reach out to us on WhatsApp for instant consultation',
              textAlign: TextAlign.center,
              style:
              TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor
              ),
            ),
            SizedBox(height:3.h,),
            Image.asset(
              'assets/call us.png',
              height: 32.h,
              width: 40.w,),
            SizedBox(height:5.h,),
            // call us on whatsapp
            CircleAvatar(
              radius: 28.sp,
              backgroundColor: Colors.white,
              child: Image.asset('assets/Whatsapp.png') ,
            ),
            SizedBox(height:1.h,),
            InkWell(
              onTap: (){},
              child: Text(
                'CLICK HERE',
                textAlign: TextAlign.center,
                style:
                TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: secondaryColor
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
