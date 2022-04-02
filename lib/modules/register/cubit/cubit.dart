import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/modules/register/cubit/states.dart';

class OnlineRegisterCubit extends Cubit<OnlineRegisterStates> {
  OnlineRegisterCubit() : super(OnlineRegisterInitialState());

  static OnlineRegisterCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}
