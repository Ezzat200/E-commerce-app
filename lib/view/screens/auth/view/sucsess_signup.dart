import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/utils/approuter.dart';
import 'package:e_commerce_app/view/widgets/auth/customButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:   Column(children: [
         const SizedBox(height: 50,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                          
                          Text('Success', style: TextStyle(fontSize: 20, color: Colors.black),)
                      ],
                    ),
                    const Icon(Icons.check_circle_outline,size: 200,color: AppColor.primaryColor,),
                    const Text('Congratulasions'),
                   const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButtonAuth(name: 'Go To Login', onPressed: () {
                        context.go(Approuter.KLoginScreen);
                      },),
                    ),
                   const SizedBox(height: 50,)
      ],),
    );
  }
}