import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/modules/login/cubit/states.dart';

class OnlineLoginCubit extends Cubit<OnlineAuctionLoginStates> {
  OnlineLoginCubit() : super(OnlineAuctionLoginInitialStates());

  static OnlineLoginCubit get(context) => BlocProvider.of(context);

  IconData sufix = Icons.visibility_outlined;
  bool isPasswordShowen = true;

  void changePasswordVisibility() {
    if (kDebugMode) {
      print("isPasswordShowen : $isPasswordShowen");
    }
    isPasswordShowen = !isPasswordShowen;
    sufix = isPasswordShowen
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(OnlineAuctionChangePasswordVisibilityStates());
  }
}
