import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';


class BodyShoppingScreen extends StatefulWidget {
  const BodyShoppingScreen({super.key});

  @override
  State<BodyShoppingScreen> createState() => _BodyShoppingScreenState();
}

class _BodyShoppingScreenState extends State<BodyShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:2 ,

      itemBuilder: (BuildContext context, int index) {

        return Card(
            child:  Row(
              children: [
                Image.asset("assets/img_1.png",
                  height: 90,width: 50,),


                Column(
                  children: [
                    Text("CeraVe Hydrating Facial Cleanser",
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Text("Brand Cerave",
                          style: TextStyle(color: Colors.grey),),
                      ],
                    ),

                    Row(
                      children: [

                        Text("500 LE",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                Column(

                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.orange.withOpacity(0.1),
                      child: Icon(Icons.delete_outline_outlined,color:secondaryColor,),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      color: Colors.orange.withOpacity(0.1),
                      child: Text("   -   1   +   "),
                    )
                  ],
                )
              ],


            )
        );


      },

    );
  }
}
