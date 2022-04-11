// ignore_for_file: avoid_print, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:onlineauction/modules/details/auction.dart';
import 'package:onlineauction/modules/details/data.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

class DetailsScreen extends StatelessWidget {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 12.0,
              child: Container(
                height: 300,
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                child: Container(
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
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  defaultButton(
                      function: () {},
                      text: 'المزايدة',
                      radius: 12.0,
                      width: 200,
                      background: Colors.orangeAccent),
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
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: CountdownTimer(
                  endTime: endTime,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
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
                views: const [
                  DataScreen(),
                  AuctionScreen(),
                ],
                onChange: (index) => print(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
