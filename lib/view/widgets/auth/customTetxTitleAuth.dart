import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  const CustomTextTitleAuth({
    super.key, required this.titleText,
  });
final String titleText;
  @override
  Widget build(BuildContext context) {
    return Text(titleText, style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,);
  }
}