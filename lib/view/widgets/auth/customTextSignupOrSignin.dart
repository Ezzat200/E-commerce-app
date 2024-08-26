import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignupOrSignin extends StatelessWidget {
  const CustomTextSignupOrSignin({
    super.key, required this.textOne, required this.textTwo, this.onPressed,
  });
final String textOne;
final String textTwo;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return   Row(mainAxisAlignment: MainAxisAlignment.center,
       children: [
    Text(textOne,style: const TextStyle(fontSize: 18),),
    TextButton(
      onPressed: onPressed
      ,
      child: Text(textTwo,style: const TextStyle(
         color: AppColor.primaryColor,fontSize: 18
      ),),
      )
     
       ],
     );
  }
}
