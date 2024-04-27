import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/custom_widgets/custom_elevated_button.dart';
import 'package:pharmacy_app/custom_widgets/custom_gradiant.dart';
import 'package:pharmacy_app/custom_widgets/custom_text_field.dart';
import 'package:pharmacy_app/custom_widgets/custom_widgets.dart';
import 'package:pharmacy_app/screens/login_screen/login_screen.dart';
import 'package:pharmacy_app/screens/register_screen/register_api/register_cubit.dart';
import 'package:pharmacy_app/screens/register_screen/register_api/register_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late TextEditingController firstNameController;
  late TextEditingController secondNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool obscureText = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    secondNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(builder: (context,state){
      return Scaffold(
        // backgroundColor: backgroundColor,
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
                          appLogo(imagePath: 'assets/logoooo.png'),
                          SizedBox(
                            height: 1.h,
                          ),
                          // welcomeText(text: 'Create Account!'),
                          SizedBox(
                            height: 2.h,
                          ),
                          //first name
                          customTextFieldRow(
                            iconTextField: 'assets/Group (1).png',
                            textField: CustomTextField(
                              hintText: 'First name',
                              type: TextInputType.name,
                              action: TextInputAction.next,
                              controller: firstNameController,
                              validator: (name) {
                                if (name.isEmpty) {
                                  return 'this field is required!';
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          //last name
                          customTextFieldRow(
                            iconTextField: 'assets/Group (1).png',
                            textField: CustomTextField(
                              hintText: 'Last name',
                              type: TextInputType.name,
                              action: TextInputAction.next,
                              controller: secondNameController,
                              validator: (name) {
                                if (name.isEmpty) {
                                  return 'this field is required!';
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
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
                              hintText: 'Set Password',
                              type: TextInputType.visiblePassword,
                              action: TextInputAction.next,
                              controller: passwordController,
                              obscureText: obscureText,
                              validator: (pass) {
                                if (pass.isEmpty) {
                                  return 'This field is required!';
                                } else if (pass.toString().length < 5) {
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
                          // confirm password textField
                          customTextFieldRow(
                            iconTextField: 'assets/mdi_password-outline.png',
                            textField: CustomTextField(
                              hintText: 'Confirm Password',
                              type: TextInputType.visiblePassword,
                              action: TextInputAction.done,
                              controller: confirmPasswordController,
                              obscureText: obscureText,
                              validator: (pass) {
                                if (pass.isEmpty) {
                                  return 'This field is required!';
                                } else if (pass.toString().length < 5) {
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
                            onPressed: (){
                                if(formKey.currentState!.validate()) {
                                 BlocProvider.of<RegisterCubit>(context).registerUser(emailController.text, firstNameController.text,
                    passwordController.text, confirmPasswordController.text);
                                }
                            },
                            text: 'Sign up',
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // don't have an account ??
                          accountOption(question: 'Already have an account ? ', option: 'Sign in',context: context,navToScreen: const LoginScreen())
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
    }, listener: (context,state){
      if(state is RegisterFailureState){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.error}")));
      }else{

      }
    });
  }
  void emailTextField(){
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
    );
  }
}



