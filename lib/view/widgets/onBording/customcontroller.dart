import 'package:e_commerce_app/controller/onBording/cubit/onbording_cubit.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomController extends StatelessWidget {
  const CustomController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingCubit, OnbordingState>(
      builder: (context, state) {
        var controller = context.read<OnbordingCubit>(); // Use the existing cubit instance
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBordingList.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: controller.currentIndex == index ? 20 : 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: controller.currentIndex == index 
                        ? AppColor.primaryColor 
                        : Colors.black12, // Optional: Change color based on active/inactive state
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
