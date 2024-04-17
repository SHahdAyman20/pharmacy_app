import 'package:flutter/material.dart';
import 'package:pharmacy_app/const/const.dart';
import 'package:pharmacy_app/custom_widgets/custom_button.dart';
import 'package:pharmacy_app/custom_widgets/custom_text_field.dart';
import 'package:pharmacy_app/custom_widgets/login_and_register_body.dart';
import 'package:pharmacy_app/screens/forget_password_screen/forget_password_screen.dart';
import 'package:pharmacy_app/screens/register_screen/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool obscureText = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  appLogo(),
                  SizedBox(
                    height: 10.h,
                  ),
                  welcomeText(text:'Welcome Back!'),
                  SizedBox(
                    height: 3.h,
                  ),
                  // email textField
                  customTextFieldRow(
                    iconTextField: 'assets/clarity_email-line.png',
                    textField: CustomTextField(
                      hintText: 'Email address',
                      type: TextInputType.emailAddress,
                      action: TextInputAction.next,
                      controller: emailController,
                      validator: (email) {
                        if (email.isEmpty) {
                          return 'this field is required!';
                        } else if (!email.toString().contains('@')) {
                          return 'Email must contain "@" ';
                        } else if (!email.toString().contains('.')) {
                          return 'Email must contain "." ';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  // password textField
                  customTextFieldRow(
                    iconTextField: 'assets/mdi_password-outline.png',
                    textField: CustomTextField(
                      hintText: 'Password',
                      type: TextInputType.visiblePassword,
                      action: TextInputAction.done,
                      controller: passwordController,
                      obscureText: obscureText,
                      validator: (pass) {
                        if (pass.isEmpty) {
                          return 'This field is required!';
                        } else if (pass.toString().length < 8) {
                          return 'this password too weak !';
                        }
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          obscureText = !obscureText;
                          setState(() {});
                        },
                        icon: obscureText
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                  ),
                  // forget password ??
                  forgotPassword(context: context,navToScreen: const ForgetPasswordScreen()),
                  SizedBox(
                    height: 3.h,
                  ),
                  // login button
                  CustomElevatedButton(
                    onPressed: (){},
                    text: 'Log In',
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  // don't have an account ??
                  accountOption(
                    question: 'Don\'t have an account ? ',
                      option: 'Sign up',
                      context: context,navToScreen: const RegisterScreen())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
