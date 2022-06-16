import 'package:onlineauction/models/signing.dart';

abstract class AddProductStates {}

class AddProductInitialState extends AddProductStates {}

class AddProductLoadingState extends AddProductStates {}

class SelectedImagesState extends AddProductStates {}

class SelectedPhotoState extends AddProductStates {}

class AddProductSuccessState extends AddProductStates {}

class AddProductErrorState extends AddProductStates {
  final String error;

  AddProductErrorState(this.error);
}
