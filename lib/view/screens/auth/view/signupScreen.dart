import 'package:e_commerce_app/controller/manager/signup/cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/core/utils/approuter.dart';
import 'package:e_commerce_app/view/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextField.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextSignupOrSignin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccessful) {
              context.go(Approuter.KLoginScreen); // Navigate on success
            } else if (state is SignUpFailuer) {
              print(state.mesrrror);
              // Optionally, display a toast or dialog for failure
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${state.mesrrror}")),
                
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign in',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const CustomTextTitleAuth(titleText: 'Welcome Back'),
                        const SizedBox(height: 20),
                        const CustomTextBodyAuth(
                          tetxBody: 'Sign Up With Email, Password, Phone, and Username',
                        ),
                        const SizedBox(height: 100),
                        CustomTextField(
                          controller: name,
                          hintText: 'Create Your Name',
                          labelText: 'Name',
                          iconData: Icons.person_outline,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: email,
                          hintText: 'Create Your Email',
                          labelText: 'Email',
                          iconData: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: phone,
                          hintText: 'Create Your Phone Number',
                          labelText: 'Phone Number',
                          iconData: Icons.phone_outlined,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: password,
                          hintText: 'Create Your Password',
                          labelText: 'Password',
                          iconData: Icons.password,
                        ),
                        const SizedBox(height: 20),
                        if (state is SignUpLoading)
                          const CircularProgressIndicator()
                        else
                          CustomButtonAuth(
                            onPressed: () {
                              context.read<SignUpCubit>().signUp(
                                name.text,
                                email.text,
                                phone.text,
                                password.text,
                              );
                            context.go(Approuter.KLoginScreen);

                            },
                            name: 'Continue',
                          ),
                        const SizedBox(height: 30),
                        CustomTextSignupOrSignin(
                          textOne: 'Already have an account? ',
                          textTwo: 'Sign in',
                          onPressed: () {
                            context.go(Approuter.KLoginScreen);
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
