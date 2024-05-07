import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/screens/home_screen/widgets/flash_sale.dart';
import 'package:pharmacy_app/screens/home_screen/widgets/home_body_screen.dart';
import 'package:pharmacy_app/screens/home_screen/widgets/products.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   String endTime='2 : 45 :30';
  final List categories=[
    {
      "image":'assets/medicine.png',
    },
    {
      "image":'assets/skinCare.png',
    },
    {
      "image":'assets/teeth.png',
    },
    {
      "image":'assets/baby.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        flexibleSpace: flexibleWidget(),
        backgroundColor:backgroundColor ,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 22.h,
        leading: searchIconWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 22.sp,right: 22.sp),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            bannerItem(url: 'assets/banner.png'),
            SizedBox(height: 1.h,),
            textWidget(text: 'Top categories', color: primaryColor),
            SizedBox(height: 1.h,),
            SizedBox(
              height: 10.h,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return categoryItem( url: categories[index]['image']);
                    }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 7.w,);
                },
                )
            ),
            SizedBox(height: 4.h,),
            Row(
              children: [
                textWidget(text: 'Flash Sale', color: secondaryColor),
                SizedBox(width: 3.w,),
                 Text("End in",style: TextStyle(
                 fontSize: 14.sp,
                  color: brownColor,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(width: 3.w,),
                Container(
                  height: 2.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8),
                    color: secondaryColor
                  ),
                  child: Text(endTime,
                  textAlign: TextAlign.center,
                    style:  TextStyle(
                      color: whiteColor,
                      fontSize: 14.sp
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h,),
            SizedBox(
                height: 37.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FlashSaleWidget(index: index,);
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 7.w,);
                },
                )
            ),
            SizedBox(height: 4.h,),
            textWidget(text: 'All products', color: primaryColor),
            SizedBox(height: 1.h,),
            SizedBox(
                height: 30.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductWidget(index: index,);
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 7.w,);
                },
                )
            ),
          ],
        ),
      )
    );
  }
}
