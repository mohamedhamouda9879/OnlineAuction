import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:onlineauction/modules/products/products.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesScreen extends StatelessWidget {
  List<ProductModel> products = [
    ProductModel("هواتف",
        "https://fdn.gsmarena.com/imgroot/news/19/12/top-phones-of-2019/-727/gsmarena_001.jpg"),
    ProductModel("ساعات",
        "https://vid.alarabiya.net/images/2020/02/06/8d261733-d2da-46a2-8e78-caf169c2a8c2/8d261733-d2da-46a2-8e78-caf169c2a8c2_16x9_1200x676.jpg?width=1138"),
    ProductModel("انتيكات",
        "https://cdnuploads.aa.com.tr/uploads/Contents/2020/12/05/thumbs_b_c_fcd2cd35d3573ed0bba5448dbd4d33a5.jpg?v=122226"),
  ];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: ConditionalBuilderRec(
        condition: true,
        builder: (context) => AnimationLimiter(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return CategoryItem(context, mq.width * 0.80, mq.height * 0.30,
                  products[index].image, products[index].name, () {
                NavigateTo(
                    context, ProductsScreen(index, products[index].name));
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

class ProductModel {
  String name, image;

  ProductModel(this.name, this.image);
}
