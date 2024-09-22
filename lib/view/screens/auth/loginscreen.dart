import 'package:e_commerce_app/core/utils/approuter.dart';
import 'package:e_commerce_app/view/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextField.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextSignupOrSignin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller=TextEditingController();
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
                 const SizedBox(height: 10,),
            
                Container(
                  child: Image.asset('assets/images/logo.png',width: 100,),
                ),
                const SizedBox(height: 20,),
             
               
                      const CustomTextTitleAuth(titleText: 'Welcom Back',),
                  const SizedBox(height: 20,),
                  
                  const CustomTextBodyAuth(tetxBody: 'Sign In With Email and Password OR Cpntinue With Social Media ' ,),
                
                  const SizedBox(height: 100,),
                
                  
                         CustomTextField(
                         controller:controller,
                          hintText: 'Enter Your Email',labelText: 'Email',iconData: Icons.email_outlined,),
                    const SizedBox(height: 20,),
                     CustomTextField(
                         controller:controller,
                       
                      hintText: 'Enter Your Password',labelText: 'Password',iconData: Icons.password  ,),
                            const SizedBox(height: 20,),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Row(
                  
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text('Remember me')
                        ],
                        
                      ),
                      TextButton(onPressed: (){
                        context.go(Approuter.KFrogetPassword);
                      }, child: const Text(
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                           decoration: TextDecoration.underline,
                        ),
                        'Forgot Password')),
                  
                      ],
                    ),
                            const SizedBox(height: 40,),
                
                    CustomButtonAuth(
                      onPressed: () {
                        
                      },
                      name: 'Continue',),
                  
                  
                  
                  const SizedBox(height: 30,),
                     CustomTextSignupOrSignin(
                  textOne: 'dont have an account? ',
                  textTwo: 'Sign in',
                  onPressed: () {
                    context.go(Approuter.KSignUpScreen);
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


