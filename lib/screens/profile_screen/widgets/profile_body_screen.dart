import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/custom_widgets/custom_outlined_button.dart';
import 'package:pharmacy_app/screens/register_screen/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
  return  Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 12.h,),
        Text("Menna Mahmoud",
          style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,
              fontSize: 22.sp),),
        SizedBox(height: 2.h,),
        Text("Email",
          style: TextStyle(color: profileTextColor,fontWeight: FontWeight.w400,
              fontSize: 18.sp),),
        SizedBox(height: 2.h,),
        Text("mennaMmahmoud123@gmail.com",
          style: TextStyle(color: blackColor,fontWeight: FontWeight.w400,
              fontSize: 18.sp),),
        SizedBox(height: 2.h,),
        Text("Password",
          style: TextStyle(color: profileTextColor,fontWeight: FontWeight.w400,
              fontSize: 18.sp),),
        SizedBox(height: 2.h,),
        Text("********",
          style: TextStyle(color: blackColor,fontWeight: FontWeight.w400,
              fontSize: 18.sp),),
        SizedBox(height: 18.h,),
        CustomOutlinedButton(text: 'Log out', onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterScreen()));
        },),
      ],
    )
  );
  }
}
