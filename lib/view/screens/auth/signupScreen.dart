import 'package:e_commerce_app/core/utils/approuter.dart';
import 'package:e_commerce_app/view/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextField.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextSignupOrSignin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children:[
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                      
                      Text('Sign in', style: TextStyle(fontSize: 20, color: Colors.black),)
                  ]
                ),
                
                const SizedBox(height: 20,),
             
                
               
                        const CustomTextTitleAuth(titleText: 'Welcom Back',),
                    const SizedBox(height: 20,),
                    
                    const CustomTextBodyAuth(tetxBody: 'Sign Up With Email and Password and phone and usrename ' ,),
                  
                    const SizedBox(height: 100,),
                  
                    
                          const CustomTextField(hintText: 'create Your Name',labelText: 'name',iconData: Icons.person_outline,),
                      const SizedBox(height: 20,),
                        const CustomTextField(hintText: 'create Your Email',labelText: 'Email',iconData: Icons.email_outlined,),
                      const SizedBox(height: 20,),
                        const CustomTextField(hintText: 'create Your Phone Number',labelText: 'phone number',iconData: Icons.phone_outlined,),
                      const SizedBox(height: 20,),
                      const CustomTextField(hintText: 'create Your Password',labelText: 'Password',iconData: Icons.password  ,),
                const SizedBox(height: 20,),
                    
                      
            
                    const  CustomButtonAuth(name: 'Continue',),
                    
                    
                    
                    const SizedBox(height: 30,),
                   CustomTextSignupOrSignin(
                    textOne: 'already have an account? ',
                    textTwo: 'Sign Up',
            onPressed: () {
                      context.go(Approuter.KLoginScreen);
              
            },
                   )
                  
                   
              
              ]
             ),
          ),
        ),
      )

        
      );
    
  }
}



