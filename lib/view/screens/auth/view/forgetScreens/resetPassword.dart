import 'package:e_commerce_app/view/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextField.dart';
import 'package:flutter/material.dart';


class ResetpasswordScreen extends StatelessWidget {
  const ResetpasswordScreen({super.key});

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
                          
                          Text('Reset Password', style: TextStyle(fontSize: 20, color: Colors.black),)
                      ]
                    ),
                 
            
                
                const SizedBox(height: 20,),
              
                        const CustomTextTitleAuth(titleText: 'Check Email',),
                    const SizedBox(height: 20,),
                    
                    const CustomTextBodyAuth(tetxBody: 'Sign Up With Email and Password OR Cpntinue With Social Media ' ,),
                  
                    const SizedBox(height: 40,),
                  
                    
                           CustomTextField(
                           controller:controller,
                            hintText: 'Enter Your Email',labelText: 'Email',iconData: Icons.email_outlined,),
                      const SizedBox(height: 20,),
                    
                    
                      
            
                      CustomButtonAuth(
                        onPressed: () {
                          
                        },
                        name: 'check',),
                    
                    
                    
                 
              ]
             ),
          ),
        ),
      )

        
      );
    
  }
}


