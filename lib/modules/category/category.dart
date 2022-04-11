import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:onlineauction/modules/products/products.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: ConditionalBuilderRec(
        condition: true,
        builder: (context) => AnimationLimiter(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return CategoryItem(
                  context, mq.width * 0.80, mq.height * 0.30, 'phones', () {
                NavigateTo(context, const ProductsScreen());
              });
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
          ),
        ),
        fallback: (context) => Center(
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
      ),
    );
  }
}
