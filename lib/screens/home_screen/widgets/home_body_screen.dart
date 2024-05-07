import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget flexibleWidget(){
  return Container(
    decoration:  BoxDecoration(
        color: whiteColor,
        border: Border.all(color: brownColor),
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset('assets/logoooo.png',width: 30.w,height: 20.h,)
      ],
    ),
  );
}


Widget searchIconWidget(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: IconButton(
          onPressed: () {  },
          icon: const Icon(Icons.search),),
      ),
    ],
  );
}


Widget bannerItem({required String url}){
  return Container(
    padding: EdgeInsets.only(right: 20.sp,left: 20.sp),
    height: 16.h,
    width: 20.w,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      color: secondaryColor
    ),
    margin:  EdgeInsets.symmetric(vertical: 15.sp,),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text("FREE SHIPPING !",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                    color: whiteColor
                ),),
                Text("For the first order",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                      color: whiteColor
                  ),
                ),
            ],
          ),
        ),
        const Spacer(),
        Image.asset(url,height: 25.h,width: 25.w,),
      ],
    ),
  );
}



Widget textWidget({required String text,required Color color}) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: color),
  );
}



Widget categoryItem({required String url}){
  return Container(
    padding: const EdgeInsets.all(8),
   decoration: BoxDecoration(
     color: whiteColor,
     borderRadius: BorderRadiusDirectional.circular(12),
     border: Border.all(color: brownColor)
   ),
    child: InkWell(
      onTap: ()
      {
        // Here Will open Categories Screen
      },
      child:
        Image.asset(url,width: 15.w,)
    ),
  );
}



Widget flexibleDetailsWidget(){
  return Container(
    decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: brownColor),
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
    ),
  );
}
