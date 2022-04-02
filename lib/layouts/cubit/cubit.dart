import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/layouts/cubit/states.dart';
import 'package:onlineauction/modules/favourites/favourites.dart';
import 'package:onlineauction/modules/products/products.dart';
import 'package:onlineauction/modules/profile/profile.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    FavouritesScreen(),
    ProfileScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}
