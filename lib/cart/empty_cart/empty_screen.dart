import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';



class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back,
            color: Colors.blueGrey),
        centerTitle: true,
        title:Text("My Shopping Cart"
          ,style: TextStyle(
              color: Colors.blueGrey,fontSize: 15
          ),) ,
      ),


      body: Column(
        children: [
          SizedBox(height: 125,),
          Center(child: Image.asset("assets/img.png",
            height: 250,width: 150,)),

          Text("Your cart is empty",
            style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 15
            ),
          ),
          SizedBox(height: 11,),
          Text("Looks like you have not made\n your choise yet...",style: TextStyle(color: Colors.grey),),
          SizedBox(height: 30,),


          InkWell(
            child: Container(
              height: 35,
              width: 200,

              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Start Shopping",
                    style: TextStyle(
                      color: secondaryColor,
                    ),),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: secondaryColor)
              ),

            ),
          )

        ],

      ),

    );
  }
}
