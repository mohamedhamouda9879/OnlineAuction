import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/modules/details/cubit/cubit.dart';
import 'package:onlineauction/modules/details/cubit/states.dart';
import 'package:onlineauction/shared/styles/colors.dart';

class DataScreen extends StatelessWidget {
  String nameOfCategory;

  DataScreen(this.nameOfCategory);

  @override
  Widget build(BuildContext context) {
    int x = 0;
    return BlocConsumer<ProductDetailsCubit, ProductsDetailsStates>(
      listener: (context, state) {
        if (state is ProductsDetailsInitialState) {}
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Card(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Date : ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          '${ProductDetailsCubit.get(context).productModel!.product!.createdAt!.substring(0, 10).toString()} / ${ProductDetailsCubit.get(context).productModel!.product!.createdAt!.substring(12, 16).toString()}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Card(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'End Date : ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          '${ProductDetailsCubit.get(context).productModel!.product!.createdAt!.substring(0, 8)}${ProductDetailsCubit.get(context).x} / ${ProductDetailsCubit.get(context).productModel!.product!.createdAt!.substring(12, 16).toString()}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Card(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          ProductDetailsCubit.get(context)
                              .productModel!
                              .product!
                              .describtion!,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
