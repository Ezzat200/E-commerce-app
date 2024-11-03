import 'package:e_commerce_app/controller/manager/auth/login/cubit/login_cubit.dart';
import 'package:e_commerce_app/core/utils/approuter.dart';
import 'package:e_commerce_app/view/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextField.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextSignupOrSignin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(), // Pass Api instance
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessful) {
              context.go(Approuter.KHomeScreen);
            } else if (state is LoginFailuer) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        const CustomTextTitleAuth(titleText: 'Welcome Back'),
                        const SizedBox(height: 20),
                        const CustomTextBodyAuth(
                          tetxBody: 'Sign Up With Email, Password, Phone, and Username',
                        ),
                        const SizedBox(height: 100),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Enter Your Email ',
                          labelText: 'Email',
                          iconData: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: passwordController,
                          hintText: 'Enter Your Password',
                          labelText: 'Password',
                          iconData: Icons.password,
                        ),
                        const SizedBox(height: 20),
                        
                            
                             CustomButtonAuth(
                                onPressed: () {
                                  if (emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty) {
                                    context.read<LoginCubit>().login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Please enter email and password')),
                                    );
                                  }
                                },
                                name: 'Continue',
                              ),
                        const SizedBox(height: 30),
                        CustomTextSignupOrSignin(
                          textOne: 'Don\'t have an account? ',
                          textTwo: 'Sign Up',
                          onPressed: () {
                            context.go(Approuter.KSignUpScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
