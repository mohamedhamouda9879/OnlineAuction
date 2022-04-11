import 'package:flutter/material.dart';
import 'package:onlineauction/shared/components/components.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.3,
          childAspectRatio: 1 / 1.73,
          children: List.generate(
            10,
            (index) => buildGridProduct(),
          ),
        ),
      ),
    );
  }
}
