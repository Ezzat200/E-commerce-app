import 'package:e_commerce_app/controller/manager/auth/forgetPassword/resetPassword/cubit/resetpassword_cubit.dart';
import 'package:e_commerce_app/core/utils/approuter.dart';
import 'package:e_commerce_app/view/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> form = GlobalKey();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BlocProvider(
            create: (context) => ResetpasswordCubit(),
            child: BlocConsumer<ResetpasswordCubit, ResetpasswordState>(
              listener: (context, state) {
             if(state is ResetpasswordSuccess){
                  context.go(Approuter.KSuccessSignup);
                }else if(state is ResetpasswordFailuer){
                   Text(state.message);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Form(
                    key: form,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Reset Password Yourl ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                                                 ),
                        const SizedBox(height: 20),
                        const CustomTextTitleAuth(titleText: 'Check Email'),
                        const SizedBox(height: 20),
                        const CustomTextBodyAuth(
                          tetxBody:
                              'Sign Up With Email and Password OR Continue With Social Media',
                        ),
                        const SizedBox(height: 40),

                        // Password field
                        CustomTextField(
                          controller: passwordController,
                          hintText: 'Create Your Password',
                          labelText: 'Password',
                          iconData: Icons.lock,
                        ),
                        const SizedBox(height: 20),

                        CustomTextField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm Your Password',
                          labelText: 'Confirm Password',
                          iconData: Icons.lock_outline,
                        ),
                        const SizedBox(height: 20),

                        
                        CustomButtonAuth(
                          onPressed: () {
                           
                            context
                                .read<ResetpasswordCubit>()
                                .resetPassword( email,passwordController.text,);
                          },
                          name: 'Check',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
