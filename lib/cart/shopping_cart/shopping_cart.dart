import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';

import 'body_shopping_cart.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: backgroundColor,
      appBar:  AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back,
              color: Colors.blueGrey),
          centerTitle: true,
          title:Text("My Shopping Cart"
            ,style: TextStyle(
                color: Colors.blueGrey,fontSize: 15
            ),)
      ),
      body: BodyShoppingScreen(),

    );

  }
}
