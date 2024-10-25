import 'package:e_commerce_app/controller/onBording/cubit/onbording_cubit.dart';
import 'package:e_commerce_app/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingCubit,OnbordingState>(
      builder: (context, state) {
        var conti = context.read<OnbordingCubit>(); 
        return Container(
          child: MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: () => {
                conti.next(context),
                
                  
              },
              child: const Text('Continue')),
        );
      },
    );
  }
}
