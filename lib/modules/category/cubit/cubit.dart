import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/modules/category/cubit/states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);

  //List<CategoryModel> categoryModel = [];

  // void getCategory(BuildContext context) {
  //   DioHelper.getData(Url: 'categories').then((value) {
  //     (value.data as List<dynamic>).forEach(
  //       (element) {
  //         // var category = CategoryModel.fromJson(element);
  //         // categoryModel.add(category);
  //       },
  //     );
  //     emit(CategorySuccessState());
  //   }).catchError((error) {
  //     print(error);
  //     emit(CategoryErrorState());
  //   });
  // }
}
