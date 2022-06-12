import 'package:onlineauction/models/signing.dart';

abstract class OnlineRegisterStates {}

class OnlineRegisterInitialState extends OnlineRegisterStates {}

class OnlineRegisterLoadingState extends OnlineRegisterStates {}

class RegisterChangePasswordVisibilityState extends OnlineRegisterStates {}

class NewsRegisterLoadingState extends OnlineRegisterStates {}

class NewsRegisterSuccessState extends OnlineRegisterStates {
  final SigningModel registerModel;

  NewsRegisterSuccessState(this.registerModel);
}

class NewsRegisterErrorState extends OnlineRegisterStates {
  final String error;

  NewsRegisterErrorState(this.error);
}
