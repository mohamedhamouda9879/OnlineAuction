import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onlineauction/layouts/home.dart';
import 'package:onlineauction/modules/about/about.dart';
import 'package:onlineauction/modules/category/category.dart';
import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/modules/on_boarding/onboarding.dart';
import 'package:onlineauction/shared/bloc_observer.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/network/local/cache_helper.dart';
import 'package:onlineauction/shared/network/remote/dio_helper.dart';
import 'package:onlineauction/shared/styles/colors.dart';

import 'shared/components/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();

  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  TOKEN = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    widget = HomeScreen();
    // if (TOKEN != null) {
    //   widget = HomeScreen();
    // } else {
    //   widget = LoginScreen();
    // }
  } else {
    widget = OnBoardingScreen();
  }
  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp(widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp(this.startWidget);

  static const appTitle = 'Online Action';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: CategoriesScreen(),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: defaultColor,
//               ),
//               child: Center(child: Text('Online Auction')),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: defaultButton(
//                 function: () {
//                   NavigateTo(context, CategoriesScreen());
//                 },
//                 text: 'Home',
//                 background: Colors.orange.shade400,
//                 radius: 8,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: defaultButton(
//                 function: () {
//                   NavigateTo(context, AboutScreen());
//                 },
//                 text: 'Favorite',
//                 background: Colors.orange.shade400,
//                 radius: 8,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: defaultButton(
//                 function: () {
//                   NavigateTo(context, ProfileScreen());
//                 },
//                 text: 'Profile',
//                 background: Colors.orange.shade400,
//                 radius: 8,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
