import 'package:e_commerce_app/controller/manager/test/cubit/test_cubit.dart';
import 'package:e_commerce_app/core/constant/imageasset.dart';
import 'package:e_commerce_app/core/functions/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data Example"),
      ),
      body: BlocProvider(
        create: (context) => TestCubit()..getData(), // Call getData when Cubit is created
        child: BlocConsumer<TestCubit, TestState>(
          listener: (context, state) {
            if (state is Testsuccess) {
              print("Data fetched successfully");
            } else if (state is Testfailuer) {
              print(state.message);
            }
          },
          builder: (context, state) {
            if (state is Testloading) {
              return Center(child: LottieBuilder.asset(AppImage.offline)); // Loading indicator
            } else if (state is Testsuccess) {
              return ListView.builder(
                itemCount: state.user.length,  // assuming the userList is in state.users
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${state.user[index].userEmail}"),  // Display user data
                    // subtitle: Text(state.user[index].email),
                  );
                },
              );
            } else if (state is Testfailuer) {
              return Center(
                child: Text("Failed to fetch data: ${state.message.message}"),
              );
            } else {
              return Center(child: Text("Press button to load data"));
            }
          },
        ),
      ),
    );
  }
}
