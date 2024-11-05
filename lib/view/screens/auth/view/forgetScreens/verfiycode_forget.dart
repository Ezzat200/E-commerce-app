import 'package:e_commerce_app/controller/manager/auth/forgetPassword/verfiycode/cubit/forget_verfiycode_cubit.dart';
import 'package:e_commerce_app/controller/manager/auth/verfiycode/cubit/verfiycode_cubit.dart';
import 'package:e_commerce_app/core/utils/approuter.dart';
import 'package:e_commerce_app/view/screens/auth/view/forgetScreens/resetPassword.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';



class VerfiycodeForgetScreen extends StatelessWidget {
  const VerfiycodeForgetScreen({super.key, required this.email});
  final String email;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
           BlocProvider(
             create: (context) => ForgetVerfiycodeCubit(),
             child: BlocConsumer<ForgetVerfiycodeCubit, ForgetVerfiycodeState>(
               listener: (context, state) {
                if (state is ForgetVerfiycodeSuccess ) {
  Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResetPasswordScreen(
                    email: email,
                  ),
                ),
              );
  
} else if (state is ForgetVerfiycodeFailuer) {
              
              
          showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("please try agin"),
                  content: Text(state.mesrrror),
                ),
              );
              
            }
               },
               builder: (context, state) {
                 return SafeArea(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 20),
                                            const Text(
                                              'Verify Code',
                                              style: TextStyle(fontSize: 20, color: Colors.black),
                                            ),
                                            const SizedBox(height: 20),
                                            CustomTextTitleAuth(titleText: 'Check Email'),
                                            const SizedBox(height: 20),
                                            CustomTextBodyAuth(
                                              tetxBody: 'Please Enter The Digit Code Sent To $email',
                                              
                                            ),
                                            const SizedBox(height: 40),
                                          OtpTextField(
                                numberOfFields: 5,
                                borderColor: Color(0xFF512DA8),
                                showFieldAsBox: true,
                                onSubmit: (String verificationCode) {
                                  context.read<ForgetVerfiycodeCubit>().getVerfiyCode(verificationCode, email);
                                  if(state is VerfiycodeSuccessful){
                                    context.go(Approuter.KSuccessSignup);
                                  print("Email: $email, Code: $verificationCode");
                                  }
                                },
                              ),
                              
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
               },
             ),
           ));
        }
    
  }

