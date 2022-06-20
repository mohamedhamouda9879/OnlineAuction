import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/modules/contact_us/cubit/states.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/network/remote/dio_helper.dart';

class ContactCubit extends Cubit<ContactsStates> {
  ContactCubit() : super(ContactsInitialState());

  static ContactCubit get(context) => BlocProvider.of(context);

  void SendRequest(
      {required String name,
      required String email,
      required String subject,
      required String message,
      required BuildContext context}) async {
    await DioHelper.postData(
      Url: "contact",
      data: {
        'name': name,
        'email': email,
        'subject': subject,
        'message': message,
      },
    ).then((value) {
      showToast(
          message: 'Request successfully', toastStates: ToastStates.SUCCESS);
      emit(ContactsSuccessState());
    }).catchError((error) {
      showToast(
          message: "Please Enter Right Data.", toastStates: ToastStates.EROOR);
      emit(ContactsErrorState());
    });
  }
}
