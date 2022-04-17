// ignore_for_file: avoid_print, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:onlineauction/modules/category/category.dart';
import 'package:onlineauction/modules/details/auction.dart';
import 'package:onlineauction/modules/details/data.dart';
import 'package:onlineauction/modules/favourites/favourites.dart';
import 'package:onlineauction/modules/profile/profile.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

class DetailsScreen extends StatelessWidget {
  int endTime = DateTime.now().millisecondsSinceEpoch + 100000 * 30;
  String name;
  DetailsScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        backgroundColor: defaultColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 12.0,
                shadowColor: defaultColor,
                child: Container(
                  color: defaultColor,
                  height: 300,
                  alignment: Alignment.center,
                  child: Container(
                    color: defaultColor,
                    padding: const EdgeInsets.all(3.0),
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      height: 180,
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://images.anandtech.com/doci/9770/X-T30_DSF5320_678x452.jpg',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: defaultColor,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: defaultColor,
                              child: Image.asset('assets/images/logo.png'),
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'iphone 13 pro max',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    defaultButton(
                        function: () {},
                        text: 'المزايدة',
                        radius: 12.0,
                        width: 200,
                        background: Color.fromARGB(255, 228, 107, 58)),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 12.0,
                shadowColor: defaultColor,
                child: Container(
                  color: defaultColor,
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  child: CountdownTimer(
                    textStyle:
                        TextStyle(color: Color.fromARGB(255, 228, 107, 58)),
                    endTime: endTime,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                color: defaultColor,
                width: 600,
                height: 600,
                child: ContainedTabBarView(
                  tabs: const [
                    Text(
                      'Data',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Auction',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                  views: [
                    DataScreen(name),
                    const AuctionScreen(),
                  ],
                  onChange: (index) => print(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
