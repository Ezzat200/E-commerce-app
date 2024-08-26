import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hintText, required this.labelText, required this.iconData, this.controller,
  });
final String hintText;
final String labelText;
final IconData iconData;
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      
      decoration: InputDecoration(
contentPadding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      
      hintText: hintText,
        labelText: labelText,
        suffixIcon: IconButton(onPressed: (){}, icon: Icon(iconData)),
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(50),
          
        ),
        ),
    
    );
  }
}