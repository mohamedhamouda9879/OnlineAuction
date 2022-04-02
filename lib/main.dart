import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/layouts/home.dart';
import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/shared/bloc_observer.dart';
import 'package:onlineauction/shared/components/constants.dart';
import 'package:onlineauction/shared/network/local/cache_helper.dart';
import 'package:onlineauction/shared/network/remote/dio_helper.dart';

void main() async {
  await DioHelper.init();
  // await CacheHelper.init();
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  Widget widget;
  //TOKEN = CacheHelper.getData(key: 'token');

  // if (TOKEN != null) {
  //   widget = HomeScreen();
  // } else {
  //   widget = LoginScreen();
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Widget startWidget;
  // MyApp(this.startWidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
