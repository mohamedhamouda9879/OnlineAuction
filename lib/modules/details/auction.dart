import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:onlineauction/modules/details/cubit/cubit.dart';
import 'package:onlineauction/modules/details/cubit/states.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

class AuctionScreen extends StatelessWidget {
  const AuctionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductsDetailsStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
            child: ConditionalBuilderRec(
              condition: ProductDetailsCubit.get(context)
                  .productModel!
                  .user!
                  .isNotEmpty,
              builder: (context) => AnimationLimiter(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: ProductDetailsCubit.get(context)
                      .productModel!
                      .user!
                      .length,
                  itemBuilder: (context, index) {
                    return item(
                        ProductDetailsCubit.get(context)
                            .productModel!
                            .user![index]
                            .name!,
                        ProductDetailsCubit.get(context)
                            .productModel!
                            .user![index]
                            .startingPrice!);
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
          ),
        );
      },
    );
  }
}

Widget item(String name, String price) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              const Text(
                'Auctions',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                '$name',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                '$price',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 15.0,
              ),
              myDivider()
            ],
          ),
        ),
      ],
    );
