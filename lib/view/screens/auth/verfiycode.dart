import 'package:e_commerce_app/view/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextField.dart';
import 'package:flutter/material.dart';


class VerfiycodeScreen extends StatelessWidget {
  const VerfiycodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller=TextEditingController();
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children:[
             const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                      
                      Text('Verfiy Code', style: TextStyle(fontSize: 20, color: Colors.black),)
                  ]
                ),
             

            
            const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                    const CustomTextTitleAuth(titleText: 'Check Email',),
                const SizedBox(height: 20,),
                
                const CustomTextBodyAuth(tetxBody: 'Sign Up With Email and Password OR Cpntinue With Social Media ' ,),
              
                const SizedBox(height: 40,),
              
                
                       CustomTextField(
                       controller:controller,
                        hintText: 'Enter Your Email',labelText: 'Email',iconData: Icons.email_outlined,),
                  const SizedBox(height: 20,),
                
                
                  

                const  CustomButtonAuth(name: 'check',),
                
                
                
                ],
              ),
            ),
          )
          ]
         ),
      )

        
      );
    
  }
}


