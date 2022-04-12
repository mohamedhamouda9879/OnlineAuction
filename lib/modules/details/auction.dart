import 'package:flutter/material.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';

class AuctionScreen extends StatelessWidget {
  const AuctionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: defaultColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 12.0,
      shadowColor: defaultColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Auctions name',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Ahmed mohamed',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Mohaed ali',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'ibrahim osama ',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Auctions date',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    '12/5/2025',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    '1/1/3030',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    '22/8/2055',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Auctions Price',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    '102015',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    '125555',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    '2525258',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
