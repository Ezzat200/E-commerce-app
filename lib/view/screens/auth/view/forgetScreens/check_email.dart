import 'package:e_commerce_app/controller/manager/auth/forgetPassword/checkemail/cubit/checkemail_cubit.dart';
import 'package:e_commerce_app/core/utils/approuter.dart';
import 'package:e_commerce_app/view/screens/auth/view/forgetScreens/verfiycode_forget.dart';
import 'package:e_commerce_app/view/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Removed nullable type here as controller is always initialized
    TextEditingController email = TextEditingController();
    GlobalKey<FormState> form = GlobalKey();
    // Function to validate email
    bool validateEmail(String email) {
      // Simple email pattern for validation
      final emailRegExp =
          RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$");
      return emailRegExp.hasMatch(email);
    }

    return Scaffold(
      body: BlocProvider(
        create: (context) => CheckemailCubit(),
        child: BlocConsumer<CheckemailCubit, CheckemailState>(
          listener: (context, state) {
             if(state is CheckemailSuccess){
             Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VerfiycodeForgetScreen(
                    email: email.text,
                  ),
                ),
              );
           }else if(state is CheckemailFailuer){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
              );
           }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Form(
                    key: form,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Check Email',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const CustomTextTitleAuth(titleText: 'Check Email'),
                        const SizedBox(height: 20),
                        const CustomTextBodyAuth(
                          tetxBody:
                              'Please Enter Your Email Address to Receive a Verification Code',
                        ),
                        const SizedBox(height: 40),
                        CustomTextField(
                          controller: email,
                          hintText: 'Enter Your Email',
                          labelText: 'Email',
                          iconData: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
                        CustomButtonAuth(
                          onPressed: () {
                            context.read<CheckemailCubit>().checkEmail(
                                  email.text,
                                );
                            print("object");
                          },
                          name: 'Check',
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
