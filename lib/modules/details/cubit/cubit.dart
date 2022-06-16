import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/models/details.dart';
import 'package:onlineauction/modules/details/cubit/states.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/components/constants.dart';
import 'package:onlineauction/shared/network/remote/dio_helper.dart';

class ProductDetailsCubit extends Cubit<ProductsDetailsStates> {
  ProductDetailsCubit() : super(ProductsDetailsInitialState());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  DetailsModel? productModel;

  void getProductDetails(BuildContext context, String id) async {
    await DioHelper.getData(Url: 'inforramtionaus/$id', auth: 'Bearer $TOKEN')
        .then((value) {
      print('done y basha details');
      print(value.data['product']);
      productModel = DetailsModel.fromJson(value.data['product']);
      print('done y basha details');
      emit(ProductsDetailsSuccessState());
    }).catchError((error) {
      print(error);
      emit(ProductsDetailsErrorState(error));
    });
  }

  void AddAcc(
      {required String productId,
      required String name,
      required String price,
      required String userId,
      required String visacard,
      required String date,
      required String cvv,
      required BuildContext context}) async {
    await DioHelper.postData(
      Url: "add_auc",
      auth: 'Bearer $TOKEN',
      data: {
        'product_id': productId,
        'name': name,
        'price': price,
        'user_id': userId,
        'numbercard': visacard,
        'date_end': date,
        'codecard': cvv,
      },
    ).then((value) {
      print('bos value');
      print(value.data);
      if (value.data[0] == 'success') {
        showToast(message: 'Success', toastStates: ToastStates.SUCCESS);
        emit(ProductsAddAccSuccessState());
      } else {
        showToast(
            message: 'Please increase your price',
            toastStates: ToastStates.EROOR);
      }
    }).catchError((error) {
      print(error);
      showToast(
          message: "Please Enter Right Data.", toastStates: ToastStates.EROOR);
      emit(ProductsAddAccErrorState());
    });
  }
}
