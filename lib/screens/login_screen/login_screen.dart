import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/custom_widgets/custom_elevated_button.dart';
import 'package:pharmacy_app/custom_widgets/custom_gradiant.dart';
import 'package:pharmacy_app/custom_widgets/custom_text_field.dart';
import 'package:pharmacy_app/custom_widgets/custom_widgets.dart';
import 'package:pharmacy_app/screens/register_screen/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../localization/lang_cubit/cubit.dart';
import 'login_api/login_cubit.dart';
import 'login_api/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  bool obscureText = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageCubit = BlocProvider.of<LanguageCubit>(context);

    return BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
      return Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            decoration: CustomGradient().buildGradientDecoration(),
            child: ListView(
              children: [
                Stack(
                  children: [
                     customHeader(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          InkWell(
                              onTap: () {
                                // languageCubit.selectLanguage(Language.arabic);
                              },
                              child: appLogo(imagePath: 'assets/logoooo.png')),
                          SizedBox(
                            height: 2.h,
                          ),
                          // welcomeText(text:'Welcome Back!'),

                          // email textField
                          customTextFieldRow(
                            iconTextField: 'assets/clarity_email-line.png',
                            textField: CustomTextField(
                              hintText: "email",
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
                          SizedBox(
                            height: 2.h,
                          ),
                          // login button
                          CustomElevatedButton(
                            onPressed: () {
                              BlocProvider.of<LoginCubit>(context).login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                            text: 'Log In',
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // don't have an account ??
                          accountOption(
                              question: 'Don\'t have an account ? ',
                              option: 'Sign up',
                              context: context,
                              navToScreen: const RegisterScreen())
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is LoginFailureState) {
      } else {}
    });
  }
}
