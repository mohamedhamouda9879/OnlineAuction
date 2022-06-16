import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/modules/add_product/cubit/cubit.dart';
import 'package:onlineauction/modules/add_product/cubit/states.dart';
import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/components/constants.dart';
import 'package:onlineauction/shared/styles/colors.dart';

class AddProductScreen extends StatelessWidget {
  var describtionController = TextEditingController();
  var priceController = TextEditingController();
  var titleController = TextEditingController();
  var address1Controller = TextEditingController();
  var address2Controller = TextEditingController();

  String id;
  AddProductScreen(this.id);
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => AddProductCubit(),
        child: BlocConsumer<AddProductCubit, AddProductStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: defaultColor,
                resizeToAvoidBottomInset: false,
                body: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      defaultFormField(
                          controller: titleController,
                          type: TextInputType.name,
                          validate: (String? value) {},
                          label: 'title',
                          prefix: Icons.title),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          controller: describtionController,
                          type: TextInputType.name,
                          validate: (String? value) {},
                          label: 'Describtion',
                          prefix: Icons.title),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          controller: priceController,
                          type: TextInputType.number,
                          validate: (String? value) {},
                          label: 'Price',
                          prefix: Icons.title),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          controller: address1Controller,
                          type: TextInputType.name,
                          validate: (String? value) {},
                          label: 'Address ',
                          prefix: Icons.title),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Photo',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: mq.width * 0.8,
                        height: mq.height * 0.2,
                        child: AddProductCubit.get(context).image == null
                            ? IconButton(
                                onPressed: () {
                                  AddProductCubit.get(context).getImage();
                                },
                                icon: const Icon(
                                  Icons.image,
                                  size: 30.0,
                                ),
                                // icon: Image.asset('assets/images/upimage.png',
                                //     width: 40, fit: BoxFit.cover),
                              )
                            : Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(20),
                                    width: mq.width * 0.5,
                                    height: mq.height * 0.2,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Image.file(
                                      AddProductCubit.get(context).image!,
                                      width: 40,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      AddProductCubit.get(context).getImage();
                                    },
                                    icon: const Icon(
                                      Icons.image,
                                      size: 30.0,
                                    ),
                                    // icon: Image.asset('assets/images/upimage.png',
                                    //     width: 40, fit: BoxFit.cover),
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultButton(
                          radius: 12.0,
                          function: () async {
                            if (TOKEN != '' && TOKEN != null) {
                              File image;
                              FormData data = FormData.fromMap({
                                'categories': id,
                                "image": await MultipartFile.fromFile(
                                  AddProductCubit.get(context).image!.path,
                                  filename:
                                      AddProductCubit.get(context).image!.path,
                                ),
                                'Describtion': describtionController.text,
                                'Price': priceController.text,
                                'Title': titleController.text,
                                'Address': address1Controller.text,
                                'Address': address1Controller.text,
                                'Photo': await MultipartFile.fromFile(
                                  AddProductCubit.get(context).image!.path,
                                  filename:
                                      AddProductCubit.get(context).image!.path,
                                ),
                                'categories_id': id,
                                'id': id,
                              });

                              Dio dio = Dio();
                              dio
                                  .post(
                                      'https://onlineauction-egypt.com/api/addproduct',
                                      options: Options(headers: {
                                        'Authorization': 'Bearer $TOKEN',
                                      }),
                                      data: data)
                                  .then((value) {
                                showToast(
                                    message: 'Added ',
                                    toastStates: ToastStates.SUCCESS);
                              }).catchError((onError) {
                                print(onError.toString());
                              });
                            } else {
                              showToast(
                                  message: 'Please Login First',
                                  toastStates: ToastStates.WARNING);
                              NavigateTo(context, LoginScreen());
                            }
                          },
                          text: 'Add')
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
