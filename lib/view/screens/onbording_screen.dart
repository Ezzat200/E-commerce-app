import 'package:e_commerce_app/controller/onBording/cubit/onbording_cubit.dart';
import 'package:e_commerce_app/view/widgets/onBording/customButton.dart';
import 'package:e_commerce_app/view/widgets/onBording/customcontroller.dart';
import 'package:e_commerce_app/view/widgets/onBording/customslider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnbordingCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: CustomSlider(),
              ),
              Column(
                children: [
                  CustomController(),
                  SizedBox(
                    height: 150,
                  ),
                  CustomButton(),
                  SizedBox(
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
