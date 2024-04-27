import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  TextInputType type;
  TextInputAction action;
  IconButton? suffixIcon;
  bool obscureText;
  String hintText;
  TextEditingController controller;
  bool? enable;
  FormFieldValidator? validator;

  CustomTextField({
    super.key,
    required this.type,
    required this.action,
    this.suffixIcon,
    this.obscureText = false,
    required this.hintText,
    required this.controller,
    this.validator,
    this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: type,
      textInputAction: action,
      decoration: InputDecoration(
        contentPadding:const EdgeInsets.all(15),
        filled: true,
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixIconColor: primaryColor,
        fillColor: textFieldBackgroundColor,
        hintStyle: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w300,
          fontSize: 18.sp,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(8),),
        focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor),
      borderRadius: BorderRadius.circular(8),),
      ),
    );
  }
}
