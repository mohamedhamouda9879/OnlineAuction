import 'package:onlineauction/models/signing.dart';

abstract class OnlineAuctionLoginStates {}

class OnlineAuctionLoginInitialStates extends OnlineAuctionLoginStates {}

class OnlineAuctionLoginLoadingStates extends OnlineAuctionLoginStates {}

class OnlineAuctionChangePasswordVisibilityStates
    extends OnlineAuctionLoginStates {}

class NewsLoginLoadingStates extends OnlineAuctionLoginStates {}

class NewsLoginSucessStates extends OnlineAuctionLoginStates {
  SigningModel signingModel;

  NewsLoginSucessStates(this.signingModel);
}

class NewsLoginErrorStates extends OnlineAuctionLoginStates {
  final String error;
  NewsLoginErrorStates(this.error);
}
