import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  const CustomTextBodyAuth({
    super.key, required this.tetxBody,
  });
  final String tetxBody;

  @override
  Widget build(BuildContext context) {
    return Text( tetxBody, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,),textAlign: TextAlign.center,);
  }
}

