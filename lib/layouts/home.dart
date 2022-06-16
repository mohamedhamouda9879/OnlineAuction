import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/layouts/cubit/cubit.dart';
import 'package:onlineauction/layouts/cubit/states.dart';
import 'package:onlineauction/modules/about/about.dart';
import 'package:onlineauction/modules/category/category.dart';
import 'package:onlineauction/modules/contact_us/contact_us.dart';
import 'package:onlineauction/modules/instrauctions/instrauctions.dart';
import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/network/local/cache_helper.dart';
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
            backgroundColor: defaultColor,
            drawer: DrawerItem(context),
            body: CategoriesScreen(),
          );
        },
      ),
    );
  }
}
