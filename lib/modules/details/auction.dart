import 'package:flutter/material.dart';
import 'package:onlineauction/shared/components/components.dart';

class AuctionScreen extends StatelessWidget {
  const AuctionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              const Text(
                'Auctions name',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              myDivider(),
              const SizedBox(
                height: 15.0,
              ),
              const Text('Ahmed mohamed'),
              myDivider(),
              const SizedBox(
                height: 15.0,
              ),
              const Text('Mohaed ali'),
              myDivider(),
              const SizedBox(
                height: 15.0,
              ),
              const Text('ibrahim osama '),
              myDivider(),
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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              myDivider(),
              const SizedBox(
                height: 15.0,
              ),
              const Text('12/5/2025'),
              myDivider(),
              const SizedBox(
                height: 15.0,
              ),
              const Text('1/1/3030'),
              myDivider(),
              const SizedBox(
                height: 15.0,
              ),
              const Text('22/8/2055'),
              myDivider(),
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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              myDivider(),
              const SizedBox(
                height: 15.0,
              ),
              const Text('102015'),
              myDivider(),
              const SizedBox(
                height: 15.0,
              ),
              const Text('125555'),
              myDivider(),
              const SizedBox(
                height: 15.0,
              ),
              const Text('2525258'),
              myDivider(),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
