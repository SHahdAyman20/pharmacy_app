import 'package:flutter/material.dart';
import 'package:pharmacy_app/api_model/home_model/product_model.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/screens/home_screen/widgets/product_details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.index});

  final int index;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(model: products[widget.index],)));
      },
      child: Container(
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
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: ( ) {
                  setState(() {
                    products[widget.index].addToCart = !products[widget.index].addToCart;
                  });
                },
                child: CircleAvatar(
                  radius: 17.sp,
                  backgroundColor: secondaryColor,
                  child:    Icon(

                    products[widget.index].addToCart == true?
                    Icons.shopping_cart
                        :
                    Icons.shopping_cart_outlined,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            Image.asset(products[widget.index].image ,
                  height: 18.h,
                  width: 20.w,

            ),
            Text(products[widget.index].title,style: const TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
