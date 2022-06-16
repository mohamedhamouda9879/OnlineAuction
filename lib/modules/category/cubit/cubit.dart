import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/models/category_model.dart';
import 'package:onlineauction/modules/category/cubit/states.dart';

import '../../../shared/network/remote/dio_helper.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> categoryModel = [];

  void getCategory(BuildContext context) {
    DioHelper.getData(Url: 'categories').then((value) {
      (value.data['1'] as List<dynamic>).forEach(
        (element) {
          var category = CategoryModel.fromJson(element);
          categoryModel.add(category);
        },
      );
      emit(CategorySuccessState());
    }).catchError((error) {
      print(error);
      emit(CategoryErrorState());
    });
  }
}
