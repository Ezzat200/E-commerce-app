
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({
    super.key, required this.name,
  });
final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      color: AppColor.primaryColor,
      ),
      child: MaterialButton(onPressed: (){},child:  Text(name,style:const TextStyle(color: Colors.white),),));
  }
}

