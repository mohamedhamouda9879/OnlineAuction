import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:onlineauction/modules/category/cubit/cubit.dart';
import 'package:onlineauction/modules/category/cubit/states.dart';
import 'package:onlineauction/modules/products/products.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategory(context),
      child: BlocConsumer<CategoryCubit, CategoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CategorySuccessState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: defaultColor,
                title: Text('Categories'),
                centerTitle: true,
              ),
              drawer: DrawerItem(context),
              backgroundColor: defaultColor,
              body: ConditionalBuilderRec(
                condition: true,
                builder: (context) => AnimationLimiter(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: CategoryCubit.get(context).categoryModel.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                          context,
                          mq.width * 0.80,
                          mq.height * 0.30,
                          'https://onlineauction-egypt.com/public/images/${CategoryCubit.get(context).categoryModel[index].image}',
                          CategoryCubit.get(context).categoryModel[index].name,
                          () {
                        NavigateTo(
                            context,
                            ProductsScreen(
                                index,
                                CategoryCubit.get(context)
                                    .categoryModel[index]
                                    .id
                                    .toString()));
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
          } else {
            return Container(
              color: defaultColor,
              child: Center(
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
            );
          }
        },
      ),
    );
  }
}
