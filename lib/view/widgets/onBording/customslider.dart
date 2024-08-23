import 'package:e_commerce_app/controller/onBording/cubit/onbording_cubit.dart';
import 'package:e_commerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingCubit, OnbordingState>(
      builder: (context, state) {
        var controller = context.read<OnbordingCubit>(); // Use the existing cubit instance
        return Container(
          child: PageView.builder(
            controller: controller.pageController,
            onPageChanged: (value) {
              print(value);
              print(controller.currentIndex);

              controller.changePage(value);
            },
            itemCount: onBordingList.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(onBordingList[index].title!),
                  const SizedBox(height: 80),
                  Container(
                    width: 200,
                    child: Image.asset(onBordingList[index].image!),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBordingList[index].body!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
