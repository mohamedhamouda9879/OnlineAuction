import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/layouts/cubit/cubit.dart';
import 'package:onlineauction/layouts/cubit/states.dart';
import 'package:onlineauction/modules/category/category.dart';
import 'package:onlineauction/modules/favourites/favourites.dart';
import 'package:onlineauction/modules/profile/profile.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: defaultColor,
                    ),
                    child: Center(child: Text('Online Auction')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultButton(
                      function: () {
                        NavigateTo(context, CategoriesScreen());
                      },
                      text: 'Home',
                      background: Colors.orange.shade400,
                      radius: 8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultButton(
                      function: () {
                        NavigateTo(context, FavouritesScreen());
                      },
                      text: 'Favorite',
                      background: Colors.orange.shade400,
                      radius: 8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultButton(
                      function: () {
                        NavigateTo(context, ProfileScreen());
                      },
                      text: 'Profile',
                      background: Colors.orange.shade400,
                      radius: 8,
                    ),
                  ),
                ],
              ),
            ),
            body: CategoriesScreen(),
          );
        },
      ),
    );
  }
}
