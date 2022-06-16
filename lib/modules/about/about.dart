import 'package:flutter/material.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: defaultColor,
          appBar: AppBar(
            backgroundColor: defaultColor,
            title: Text('About'),
            centerTitle: true,
          ),
          drawer: DrawerItem(context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Who We Are',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Our site is one of the most popular and famous destinations for online auctions. A typical online auction on it often includes a Buy It Now price, which lets the buyer purchase the item for a set price before the listing\'s end date.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'WHY CHOOSE US?',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Here’s a quick look at the benefits of choosing us. *Larger reach: Online auctions reach buyers from around the world. If you’re worried about your stuff being given away, online auctions provide the reach to find the right buyer for each and every item. *Convenience: Buyers can bid when and where they want and bid on multiple auctions in the same day. *Provide more details: You, the seller, can review online item descriptions to ensure accuracy. *Less onsite activity: Your stuff will still be picked up, just not all at once. Pickup by appointment is a beautiful thing. *No moving: Items are pictured, sold and picked up from the same location. That’s more money in your pocket that you would have spent on moving costs.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'OUR TEAM',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'MEET OUR TELENTED TEAM MEMBER',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      AboutItem('WALAA SHEHATA', 'walaashehata@gmail.com',
                          'walaa.jpg'),
                      AboutItem('AFNAN MAMDOUH', 'afnanmamdou@gmail.com',
                          'afnan.jpg'),
                      AboutItem(
                          'SAMA AYMAN', 'samaayman945@gmail.com', 'sama.jpg'),
                      AboutItem('HABA YASSER', 'hebayasser5116@gmail.com',
                          'heba.jpg'),
                      AboutItem('YARA YASSER', 'yara.yasser20006@gmail.com',
                          'yara.jpg'),
                      AboutItem('YOUSSEF MOUSA', 'youssefmousa@gmail.com',
                          'yousef.jpg'),
                      AboutItem('MAHMOUD SALAH', 'mahmoud.salah@gmail.com',
                          'mahmoud.jpg'),
                      AboutItem('MAHMOUD AHMED', 'mahmoudahmed@gmail.com',
                          'mahmoud0.jpg')
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
