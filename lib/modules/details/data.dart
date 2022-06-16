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
    return BlocConsumer<ProductDetailsCubit, ProductsDetailsStates>(
      listener: (context, state) {},
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
                        'Category : ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
                        child: Text('$nameOfCategory',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
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
                    children: const [
                      Text(
                        'Start Date : ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Text('1/1/2020',
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
                    children: const [
                      Text(
                        'End Date : ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Text('22/3/2022',
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
