import 'package:flutter/material.dart';
import 'package:pharmacy_app/api_model/home_model/flash_sale_model.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FlashSaleWidget extends StatefulWidget {
  const FlashSaleWidget({super.key, required this.index});

  final int index;

  @override
  State<FlashSaleWidget> createState() => _FlashSaleWidgetState();
}

class _FlashSaleWidgetState extends State<FlashSaleWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10.sp),
      width:50.w,
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          border: Border.all(color: brownColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(14)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.sp),
                height: 3.h,
                width: 17.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15.sp),
                    color: secondaryColor
                ),
                child: Text(
                  "${flashSale[widget.index].discount}% Off",
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: ( ) {

                  setState(() {
                    flashSale[widget.index].addToCart = !flashSale[widget.index].addToCart;

                  });
                },
                child: CircleAvatar(
                  radius: 17.sp,
                  backgroundColor: secondaryColor,
                  child:    Icon(

                    flashSale[widget.index].addToCart == true?
                    Icons.shopping_cart
                        :
                    Icons.shopping_cart_outlined,
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          ),
          Image.asset(flashSale[widget.index].image ,
            height: 18.h,
            width: 20.w,
          ),
          Align(
            alignment: Alignment.topLeft,
              child: Text(flashSale[widget.index].title,
              style: TextStyle(
                color: blackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
              ),)),
          SizedBox(height: 1.h,),
          Align(
            alignment: Alignment.topLeft,
            child: Text("${flashSale[widget.index].amount} ML",
              style: TextStyle(
                  color: greyColor,
                  fontWeight: FontWeight.w400,
                fontSize: 14.sp
              ),
            ),
          ),
          SizedBox(height: 1.h,),
          Row(
            children: [
              Text("LE ${flashSale[widget.index].newPrice}",
                style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                  fontSize: 18.sp
                ),
              ),
              SizedBox(width: 3.w,),
              Text("LE ${flashSale[widget.index].oldPrice}",
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
