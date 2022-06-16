import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/layouts/cubit/states.dart';
import 'package:onlineauction/modules/about/about.dart';
import 'package:onlineauction/modules/category/category.dart';
import 'package:onlineauction/modules/instrauctions/instrauctions.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final advancedDrawerController = AdvancedDrawerController();

  List<Widget> bottomScreens = [
    CategoriesScreen(),
    const AboutScreen(),
    const InstructionsScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  void handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
    emit(AppChangeDrawerState());
  }
}
