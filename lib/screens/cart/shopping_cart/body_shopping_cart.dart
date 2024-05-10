import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/api_model/home_model/product_model.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/screens/home_screen/api_handling/home_cubit/home_cubit.dart';
import 'package:pharmacy_app/screens/home_screen/api_handling/home_cubit/home_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class BodyShoppingScreen extends StatefulWidget {
  const BodyShoppingScreen({super.key});

  @override
  State<BodyShoppingScreen> createState() => _BodyShoppingScreenState();
}

class _BodyShoppingScreenState extends State<BodyShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> addedProductList = products.where((productModel) => productModel.addToCart==true).toList() ;
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (BuildContext context, Object? state) {  },
      builder: (context,state){
      return ListView.builder(
        itemCount:addedProductList.length ,

        itemBuilder: (BuildContext context, int index) {

          return Container(
              height: 14.h,
              margin: EdgeInsets.symmetric(vertical: 1.h,horizontal: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(8),
                  color: whiteColor
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(addedProductList[index].image,
                      height: 90,width: 50,),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(addedProductList[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),),

                        Text(addedProductList[index].description,
                          style: const TextStyle(color: Colors.grey),),


                        Text(
                          "LE ${addedProductList[index].price}",
                          style: const TextStyle(fontWeight: FontWeight.bold),),

                      ],
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: accentRedColor,
                          child: IconButton(icon: const Icon(Icons.delete_outline_outlined,color:secondaryColor), onPressed: () {
                            setState(() {
                              addedProductList[index].addToCart = false;
                            });

                          },),
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          height: 4.h,
                          width: 16.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(8),
                              color: accentRedColor
                          ),
                          child:   Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              GestureDetector(
                                onTap: () {
                                   cubit.decrement();
                                },
                                child:  Text("-",style: TextStyle(fontSize: 16.sp,color: secondaryColor)),
                              ),
                              SizedBox(width: 2.w,),
                              Text(cubit.productNum.toString(),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
                              SizedBox(width: 2.w,),
                              GestureDetector(
                                onTap: () {
                                   cubit.increment();
                                },
                                child:  Text("+",style: TextStyle(fontSize: 16.sp,color: secondaryColor)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
          );
        },
      );
    }, );
  }
}
