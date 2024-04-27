import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';

class CustomGradient {


  // Function to create a customizable gradient BoxDecoration
  BoxDecoration buildGradientDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        colors: [
          primaryColor.withOpacity(.25),
          Colors.white,
        ],
      ),
    );
  }
}