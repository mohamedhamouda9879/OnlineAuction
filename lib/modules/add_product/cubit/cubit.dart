import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlineauction/modules/add_product/cubit/states.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/components/constants.dart';
import 'package:onlineauction/shared/network/remote/dio_helper.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(AddProductInitialState());

  static AddProductCubit get(context) => BlocProvider.of(context);

  final piker = ImagePicker();

  File? image;

  String? path;
  File? newfile;
  String? namefile;

  Future getImage() async {
    final filepiked = await piker.pickImage(source: ImageSource.gallery);

    if (filepiked != null) {
      image = File(filepiked.path);
      print('hamouda error get imahe aho');
      print(image.toString());
      emit(SelectedImagesState());
    } else {
      print('no select image');
    }
  }

  void AddProducts(
      {required String categories,
      required File image,
      required String descrption,
      required String price,
      required String title,
      required String address,
      required String address2,
      required File photo,
      required String cat_id,
      required String id,
      required FormData data,
      required BuildContext context}) async {
    emit(AddProductLoadingState());

    await DioHelper.postData(
      Url: "register",
      auth: 'Bearer $TOKEN',
      data: {
        'categories': categories,
        'image': image,
        'Describtion': descrption,
        'Price': price,
        'Title': title,
        'Address': address,
        'Address': address2,
        'Photo': photo,
        'categories_id': cat_id,
        'id': id,
      },
    ).then((value) {
      showToast(message: 'Added success', toastStates: ToastStates.SUCCESS);
      emit(AddProductSuccessState());
    }).catchError((error) {
      print('error y hamouda ${error.toString()}');
      showToast(
          message: "Please Enter Right Data.", toastStates: ToastStates.EROOR);
      emit(AddProductErrorState(error.toString()));
    });
  }
}
