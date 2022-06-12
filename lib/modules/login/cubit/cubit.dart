import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/layouts/home.dart';
import 'package:onlineauction/models/signing.dart';
import 'package:onlineauction/modules/login/cubit/states.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/network/remote/dio_helper.dart';

class OnlineLoginCubit extends Cubit<OnlineAuctionLoginStates> {
  OnlineLoginCubit() : super(OnlineAuctionLoginInitialStates());

  static OnlineLoginCubit get(context) => BlocProvider.of(context);

  IconData sufix = Icons.visibility_outlined;
  bool isPasswordShowen = true;
  SigningModel? signingModel;

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

  void UserLogin(
      {required String email,
      required String password,
      required BuildContext? context}) {
    emit(NewsLoginLoadingStates());
    DioHelper.postData(
      Url: 'login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      signingModel = SigningModel.fromJson(value.data);
      print(value.toString());
      print('hamouda login y basha ');
      // if (signingModel!.status == true) {
      //   NavigateAndFinish(context, const HomeScreen());
      //   emit(NewsLoginSucessStates(NewsLoginModel!));
      // } else {
      //   showToast(
      //       message: "Email or password wrong", toastStates: ToastStates.EROOR);
      //   emit(NewsLoginErrorStates('error'));
      // }
      if (signingModel!.token != null) {
        NavigateAndFinish(context, const HomeScreen());
        emit(NewsLoginSucessStates(signingModel!));
      } else {
        showToast(
            message: "Password or Email  incorrect",
            toastStates: ToastStates.EROOR);
        emit(NewsLoginErrorStates('error'));
      }
    }).catchError((error) {
      showToast(
          message: 'Password or Email  incorrect',
          toastStates: ToastStates.EROOR);
      emit(NewsLoginErrorStates(error.toString()));
    });
  }
}
