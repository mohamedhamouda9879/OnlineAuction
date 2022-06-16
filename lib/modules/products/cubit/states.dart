import 'package:onlineauction/models/product.dart';
import 'package:onlineauction/modules/products/products.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsSuccessState extends ProductsStates {}

class ProductsErrorState extends ProductsStates {
  ProductModel productModel;
  ProductsErrorState(this.productModel);
}
