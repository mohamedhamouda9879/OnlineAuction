import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/models/product.dart';
import 'package:onlineauction/modules/products/cubit/states.dart';
import 'package:onlineauction/modules/products/products.dart';
import 'package:onlineauction/shared/network/remote/dio_helper.dart';

class ProductCubit extends Cubit<ProductsStates> {
  ProductCubit() : super(ProductsInitialState());

  static ProductCubit get(context) => BlocProvider.of(context);

  List<ProductModel> productModel = [];

  void getProduct(BuildContext context, String id) {
    DioHelper.getData(Url: 'showproduct/$id').then((value) {
      (value.data['products']['data'] as List<dynamic>).forEach(
        (element) {
          var product = ProductModel.fromJson(element);
          productModel.add(product);
        },
      );
      emit(ProductsSuccessState());
    }).catchError((error) {
      print(error);
      emit(ProductsErrorState(error));
    });
  }

  // void DelProduct(BuildContext context, String id) {
  //   DioHelper.getData(Url: 'delete/$id').then((value) {
  //     (value.data['products']['data'] as List<dynamic>).forEach(
  //       (element) {
  //         var product = ProductModel.fromJson(element);
  //         productModel.add(product);
  //       },
  //     );
  //     emit(ProductsSuccessState());
  //   }).catchError((error) {
  //     print(error);
  //     emit(ProductsErrorState(error));
  //   });
  // }
}
