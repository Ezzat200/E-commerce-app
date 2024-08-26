import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/approuter.dart';

import 'package:e_commerce_app/data/datasource/static/static.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


part 'onbording_state.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  OnbordingCubit() : super(OnbordingInitial()) {
    pageController = PageController(); // Initialize PageController in the constructor
  }

  late PageController pageController;
  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    emit(OnbordingChangePageState(index: index));
  }

  void next( BuildContext context) {
    // Check if the current page is the last one
      currentIndex++;
    if (currentIndex > onBordingList.length - 1) {
    context.go(Approuter.KLoginScreen);
      
    }else{
    pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 900),
        curve: Curves.ease,
      );
      emit(OnbordingNext(index: currentIndex));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose(); 
    return super.close();
  }
}
