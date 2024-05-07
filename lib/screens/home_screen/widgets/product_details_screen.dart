import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/api_model/home_model/product_model.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/screens/home_screen/api_handling/home_cubit/home_cubit.dart';
import 'package:pharmacy_app/screens/home_screen/api_handling/home_cubit/home_state.dart';
import 'package:pharmacy_app/screens/home_screen/widgets/home_body_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel model;
  const ProductDetails({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit,HomeStates>(
      listener:(context,state){},
      builder:(context,state){
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: flexibleDetailsWidget(),
            leading: const BackButton(),
            centerTitle: true,
            backgroundColor:whiteColor ,
            elevation: 0,
            toolbarHeight: 10.h,
            title:  Text("Product Details",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
            foregroundColor:primaryColor,
          ),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                SizedBox(
                  height: 45.h,
                  child:Image.asset(model.image.toString(),height: 200,width: double.infinity,fit: BoxFit.fill,),

                ),
                Expanded(child:  Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                    border: Border.symmetric(horizontal: BorderSide(color: brownColor))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Text(model.title.toString(),style: TextStyle(color: Colors.black,fontSize: 22.sp,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      Text("${model.amount.toInt()} ml",style: const TextStyle(color: Color(0xffD2CCCC),fontWeight: FontWeight.bold),),
                      //    Text("${model.price} LE",style: const TextStyle(color: secondaryColor,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            height: 5.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(8),
                                color: const Color(0xffFBF2F2)
                            ),
                            child:   Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                GestureDetector(
                                  onTap: () {
                                    // cubit.decrement();
                                  },
                                  child:  Text("-",style: TextStyle(fontSize: 20.sp,color: secondaryColor)),
                                ),
                                SizedBox(width: 3.w,),
                                Text("1",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                                SizedBox(width: 3.w,),
                                GestureDetector(
                                  onTap: () {
                                    // cubit.increment();
                                  },
                                  child:  Text("+",style: TextStyle(fontSize: 20.sp,color: secondaryColor)),
                                ),

                              ],
                            ),
                          ),
                          const Spacer(),
                          Text("LE ${model.price.toInt()}",style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text("About the product",style: TextStyle(color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      Expanded(
                        child: Text(model.description.toString(),style:  const TextStyle(color: Color(0xffD2CCCC),fontWeight: FontWeight.bold),),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          MaterialButton(
                              minWidth: 45.w,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.circular(8)
                              ),
                              onPressed: ()
                              {
                                // cubit.addOrRemoveFromCart(productID: model.id!);
                              },
                              textColor: Colors.white,
                              color: secondaryColor,

                              child:  Text("Add to cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),)
                            // Text(
                            //     cubit.cartsID.contains(model.id.toString()) ?
                            //     "Remove from Cart" : "Add to Cart"
                            // ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),

        );
      },
    );
  }
}
