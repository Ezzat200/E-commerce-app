import 'package:e_commerce_app/core/functions/aletrExit.dart';
import 'package:e_commerce_app/core/utils/approuter.dart';
import 'package:e_commerce_app/view/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextField.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextSignupOrSignin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Separate controllers for email and password fields
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Use SingleChildScrollView to avoid overflow
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                  ),
                ),
                const SizedBox(height: 20),
                const CustomTextTitleAuth(titleText: 'Welcome Back'),
                const SizedBox(height: 20),
                const CustomTextBodyAuth(
                  tetxBody: 'Sign In With Email and Password OR Continue With Social Media',
                ),
                const SizedBox(height: 100),
                CustomTextField(
                  controller: emailController, // Separate controller for email
                  hintText: 'Enter Your Email',
                  labelText: 'Email',
                  iconData: Icons.email_outlined,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController, // Separate controller for password
                  hintText: 'Enter Your Password',
                  labelText: 'Password',
                  iconData: Icons.password,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text('Remember me'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        context.go(Approuter.KFrogetPassword);
                      },
                      child: const Text(
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                        'Forgot Password',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                CustomButtonAuth(
                  onPressed: () {
                    // Add your logic here
                    },
                  name: 'Continue',
                ),
                const SizedBox(height: 30),
                CustomTextSignupOrSignin(
                  textOne: 'Don\'t have an account? ',
                  textTwo: 'Sign up',
                  onPressed: () {
                       Alert(
                      context: context,
                      title: 'Login',
                      content: Text('Custom Alert Content Here'),
                      buttons: [
                        DialogButton(
                          child: Text('Continue'),
                          onPressed: () => 
                    context.go(Approuter.KSignUpScreen)
                        ),
                      ],
                    ).show();
               
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
