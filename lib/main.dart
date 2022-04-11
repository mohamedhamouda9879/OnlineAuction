import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onlineauction/modules/details/details.dart';
import 'package:onlineauction/shared/bloc_observer.dart';
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
  //TOKEN = CacheHelper.getData(key: 'token');

  // if (TOKEN != null) {
  //   widget = HomeScreen();
  // } else {
  //   widget = LoginScreen();
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // final Widget startWidget;
  // MyApp(this.startWidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: const TextTheme(
            bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        )),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            elevation: 20.0,
            backgroundColor: HexColor('333739')),
        scaffoldBackgroundColor: HexColor('333739'),
        appBarTheme: AppBarTheme(
            titleSpacing: 20.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: HexColor('333739'),
              statusBarIconBrightness: Brightness.light,
            ),
            backgroundColor: HexColor('333739'),
            elevation: 0.0,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: DetailsScreen(),
    );
  }
}
