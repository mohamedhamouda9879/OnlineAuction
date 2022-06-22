// ignore_for_file: avoid_print, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';
import 'package:onlineauction/modules/about/about.dart';
import 'package:onlineauction/modules/category/category.dart';
import 'package:onlineauction/modules/details/auction.dart';
import 'package:onlineauction/modules/details/cubit/cubit.dart';
import 'package:onlineauction/modules/details/cubit/states.dart';
import 'package:onlineauction/modules/details/data.dart';
import 'package:onlineauction/modules/instrauctions/instrauctions.dart';
import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/components/constants.dart';
import 'package:onlineauction/shared/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

class DetailsScreen extends StatelessWidget {
  int endTime = DateTime.now().millisecondsSinceEpoch + 100000 * 30;
  String id;
  DetailsScreen(this.id, {Key? key}) : super(key: key);
  var priceController = TextEditingController();
  var visaCardController = TextEditingController();
  var dateController = TextEditingController();
  var cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) =>
          ProductDetailsCubit()..getProductDetails(context, id),
      child: BlocConsumer<ProductDetailsCubit, ProductsDetailsStates>(
        listener: (context, state) {
          if (state is ProductsDetailsSuccessState) {
            TITLE =
                ProductDetailsCubit.get(context).productModel!.product!.title!;
            USERID =
                ProductDetailsCubit.get(context).productModel!.product!.userId!;

            // PRODUCTID=ProductDetailsCubit.get(context).productModel!.id!;
          }
        },
        builder: (context, state) {
          // final DateTime now = DateTime.now();
          // final DateFormat formatter = DateFormat('yyyy-MM-dd');
          // final String formatted = formatter.format(now);
          // var now2 = DateTime.parse(formatted.toString());
          // // var dataaa = ProductDetailsCubit.get(context).date;
          // var myDate = ProductDetailsCubit.get(context).dateTime;
          // final String formatted2 = formatter.format(myDate!);
          // var now3 = DateTime.parse(formatted2.toString());
          // bool valDate = now2.isAfter(now3);
          // print(valDate);
          // print('--------ahbd y hamouda-------');
          // print(ProductDetailsCubit.get(context).date);
          // print(now2.toString());
          // print(now3.toString());
          print(ProductDetailsCubit.get(context).date);
          if (state is ProductsDetailsSuccessState) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: defaultColor,
                ),
                drawer: DrawerItem(context),
                backgroundColor: defaultColor,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 12.0,
                        shadowColor: defaultColor,
                        child: Container(
                          color: defaultColor,
                          height: 300,
                          alignment: Alignment.center,
                          child: Container(
                            color: defaultColor,
                            padding: const EdgeInsets.all(3.0),
                            width: MediaQuery.of(context).size.width,
                            child: CachedNetworkImage(
                              height: 180,
                              fit: BoxFit.fill,
                              imageUrl:
                                  'https://onlineauction-egypt.com/public/uploads/${ProductDetailsCubit.get(context).productModel?.product!.productImg}',
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: SizedBox(
                                  height: 100, //25706131400238
                                  width: 100,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: defaultColor,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: defaultColor,
                                      child:
                                          Image.asset('assets/images/logo.png'),
                                    ),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              ProductDetailsCubit.get(context)
                                  .productModel!
                                  .product!
                                  .title!,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Spacer(),
                            false
                                ? defaultButton(
                                    function: () {},
                                    text: 'مغلق',
                                    radius: 12.0,
                                    width: 150,
                                    background:
                                        Color.fromARGB(255, 228, 107, 58))
                                : defaultButton(
                                    function: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return BlocProvider(
                                              create: (context) =>
                                                  ProductDetailsCubit(),
                                              child: BlocConsumer<
                                                  ProductDetailsCubit,
                                                  ProductsDetailsStates>(
                                                listener: (context, state) {},
                                                builder: (context, state) {
                                                  return AlertDialog(
                                                    content: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                          right: -40.0,
                                                          top: -40.0,
                                                          child: InkResponse(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: CircleAvatar(
                                                              child: Icon(
                                                                  Icons.close),
                                                              backgroundColor:
                                                                  Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                        Form(
                                                          key: formKey,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    defaultFormField(
                                                                  controller:
                                                                      priceController,
                                                                  type: TextInputType
                                                                      .number,
                                                                  validate:
                                                                      (String?
                                                                          v) {},
                                                                  label:
                                                                      'Price',
                                                                  prefix: Icons
                                                                      .money,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: defaultFormField(
                                                                    controller:
                                                                        visaCardController,
                                                                    type: TextInputType
                                                                        .number,
                                                                    validate:
                                                                        (String?
                                                                            v) {},
                                                                    label:
                                                                        'Card Number',
                                                                    prefix: Icons
                                                                        .card_giftcard),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    defaultFormField(
                                                                  controller:
                                                                      dateController,
                                                                  type:
                                                                      TextInputType
                                                                          .name,
                                                                  validate:
                                                                      (String?
                                                                          v) {},
                                                                  label:
                                                                      'MM/YYYY',
                                                                  prefix: Icons
                                                                      .date_range,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    defaultFormField(
                                                                  controller:
                                                                      cvvController,
                                                                  type: TextInputType
                                                                      .number,
                                                                  validate:
                                                                      (String?
                                                                          v) {},
                                                                  label: 'CVV',
                                                                  prefix: Icons
                                                                      .numbers,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    defaultButton(
                                                                  function: () {
                                                                    if (formKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      // _formKey.currentState!.save();
                                                                      if (TOKEN !=
                                                                              '' &&
                                                                          TOKEN !=
                                                                              null) {
                                                                        ProductDetailsCubit.get(context).AddAcc(
                                                                            productId:
                                                                                id,
                                                                            name:
                                                                                USERNAME,
                                                                            price: priceController
                                                                                .text,
                                                                            userId:
                                                                                USERID,
                                                                            visacard:
                                                                                visaCardController.text,
                                                                            date: dateController.text,
                                                                            cvv: cvvController.text,
                                                                            context: context);
                                                                      } else {
                                                                        showToast(
                                                                            message:
                                                                                'Please Login First',
                                                                            toastStates:
                                                                                ToastStates.WARNING);
                                                                        NavigateAndFinish(
                                                                            context,
                                                                            LoginScreen());
                                                                      }
                                                                    }
                                                                  },
                                                                  text:
                                                                      'Submit',
                                                                  radius: 12.0,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          });
                                    },
                                    text: 'المزايدة الان',
                                    radius: 12.0,
                                    width: 150,
                                    background:
                                        Color.fromARGB(255, 228, 107, 58),
                                  ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: defaultColor,
                        width: 600,
                        height: 600,
                        child: ContainedTabBarView(
                          tabs: const [
                            Text(
                              'Data',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Auction',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                          views: [
                            DataScreen(id),
                            const AuctionScreen(),
                          ],
                          onChange: (index) => print(index),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }
}
