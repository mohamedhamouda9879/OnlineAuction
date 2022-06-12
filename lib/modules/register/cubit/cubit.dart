import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/models/signing.dart';
import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/modules/register/cubit/states.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/network/remote/dio_helper.dart';

class OnlineRegisterCubit extends Cubit<OnlineRegisterStates> {
  OnlineRegisterCubit() : super(OnlineRegisterInitialState());

  static OnlineRegisterCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  SigningModel? registerModel;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }

  void userRegister(
      {required String username,
      required String Fname,
      required String Lname,
      required String email,
      required String phone,
      required String password,
      required String birthday,
      required BuildContext context}) async {
    emit(NewsRegisterLoadingState());

    await DioHelper.postData(
      Url: "register",
      data: {
        'name': username,
        'F_name': Fname,
        'L_name': Lname,
        'phone_n': phone,
        'B_date': birthday,
        'email': email,
        'password': password,
      },
    ).then((value) {
      if (value.statusCode == 200 || value.statusCode == 201) {
        print('422');
        registerModel = SigningModel.fromJson(value.data);
        if (registerModel!.token != null) {
          print('register${registerModel!.token}');
          print('register${registerModel!.message}');

          NavigateAndFinish(context, LoginScreen());
          emit(NewsRegisterSuccessState(registerModel!));
        }
      }
      print('object');
      // print(value.data.toString());

      // registerModel = RegisterModel.fromJson(value.data);
      // print(value.data);
      // print('done y bashaaa');

      // NavigateAndFinish(context, LoginScreen());
      // emit(NewsRegisterSuccessState(registerModel!));
    }).catchError((error) {
      //errorModel = ErrorModel.fromJson(error.toString());
      //print(errorModel!.message.toString());

      print('error y hamouda ${error.toString()}');
      showToast(
          message: "Please Enter Right Data.", toastStates: ToastStates.EROOR);
      emit(NewsRegisterErrorState(error.toString()));
    });
  }
}
