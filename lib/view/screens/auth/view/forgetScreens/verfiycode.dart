import 'package:e_commerce_app/view/widgets/auth/customTextBodyAuth.dart';
import 'package:e_commerce_app/view/widgets/auth/customTetxTitleAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class VerfiycodeScreen extends StatelessWidget {
  const VerfiycodeScreen({super.key});

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
                          
                          Text('Verfiy Code', style: TextStyle(fontSize: 20, color: Colors.black),)
                      ]
                    ),
                 
            
                
                const SizedBox(height: 20,),
              
                        const CustomTextTitleAuth(titleText: 'Check Email',),
                    const SizedBox(height: 20,),
                    
                    const CustomTextBodyAuth(tetxBody: 'Please Enter The Digit Code Sent To Ezzat@gmailcom ',),
                  
                    const SizedBox(height: 40,),
                  
                    
                          OtpTextField(
            numberOfFields: 5,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true, 
            //runs when a code is typed in
            onCodeChanged: (String code) {
                //handle validation or checks here           
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
                showDialog(
                    context: context,
                    builder: (context){
                    return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                    );
                    }
                );
            }, // end onSubmit
                ),
                      const SizedBox(height: 20,),
                    
                    
                      
            
                     
                    
                    
                    
                   
              ]
             ),
          ),
        ),
      )

        
      );
    
  }
}


