import 'package:flutter/material.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: defaultColor,
        appBar: AppBar(
          backgroundColor: defaultColor,
          title: Text('Instructions'),
          centerTitle: true,
        ),
        drawer: DrawerItem(context),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              instructionsItem('Step 1', 'Create An Account'),
              SizedBox(
                height: 15.0,
              ),
              instructionsItem('Step 2', 'Choose The Categry'),
              SizedBox(
                height: 15.0,
              ),
              instructionsItem('Step 3', 'Choose Product'),
              SizedBox(
                height: 15.0,
              ),
              instructionsItem('Step 4', 'Bidding'),
              SizedBox(
                height: 15.0,
              ),
              instructionsItem('Step 5', 'Choose Payment Method'),
              SizedBox(
                height: 15.0,
              ),
              instructionsItem('Step 6', 'Paymnt and Receipt'),
              SizedBox(
                height: 15.0,
              ),
              myDivider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 1.0,
                            ),
                            child: Container(
                              width: 45,
                              height: 3.0,
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(end: 20.0),
                            child: Container(
                              width: 45,
                              height: 3.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Our site is one of the most popular and famous destinations for online auctions. A typical online auction on it often includes a Buy It Now price, which lets the buyer purchase the item for a set price before the listing\'s end date',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
