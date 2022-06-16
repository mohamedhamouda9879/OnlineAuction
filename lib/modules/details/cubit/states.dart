import 'package:onlineauction/models/details.dart';

abstract class ProductsDetailsStates {}

class ProductsDetailsInitialState extends ProductsDetailsStates {}

class ProductsDetailsSuccessState extends ProductsDetailsStates {}

class ProductsDetailsErrorState extends ProductsDetailsStates {
  DetailsModel detailsModel;
  ProductsDetailsErrorState(this.detailsModel);
}

class ProductsAddAccSuccessState extends ProductsDetailsStates {}

class ProductsAddAccErrorState extends ProductsDetailsStates {}
