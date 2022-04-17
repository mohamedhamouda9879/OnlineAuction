import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onlineauction/modules/category/category.dart';
import 'package:onlineauction/modules/favourites/favourites.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';

import 'modules/profile/profile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Online Action';

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
      title: appTitle,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: CategoriesScreen(),
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
    );
  }
}
