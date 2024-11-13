
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       Expanded(
         child:  TextField(
           
    
            
            decoration: InputDecoration(
              filled: true,
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
              fillColor:   AppColor.gray.withOpacity(0.1),
              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color:  AppColor.gray.withOpacity(0.1)
                ),
                
              ),
              
              enabledBorder:  OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color:  AppColor.gray.withOpacity(0.1)
                ),
                
              ),
               disabledBorder:  OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color:  AppColor.gray.withOpacity(0.1)
                ),
                
              ),
            ),
          ),  ),
       SizedBox(width: width * 0.01,),
       Container(
        width: width * 0.2,
        height: height * 0.06,
        decoration: BoxDecoration(
          color: AppColor.gray.withOpacity(0.1),
        ),
    
        child: Icon(Icons.notifications_active_outlined))
      ],
    );
  }
}