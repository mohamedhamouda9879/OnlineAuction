// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineauction/modules/about/about.dart';
import 'package:onlineauction/modules/category/category.dart';
import 'package:onlineauction/modules/contact_us/contact_us.dart';
import 'package:onlineauction/modules/instrauctions/instrauctions.dart';
import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/shared/network/local/cache_helper.dart';
import 'package:onlineauction/shared/styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.redAccent,
  bool isUpperCase = true,
  double radius = 0.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: background),
    );

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
  Color? color,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: color),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  int? lines,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      maxLines: lines,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
Widget instructionsItem(String txt1, String txt2) => SizedBox(
      width: 350,
      child: Card(
        color: Color.fromARGB(255, 214, 213, 209),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 12.0,
        shadowColor: defaultColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '$txt1',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$txt2',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ),
    );
Widget AboutItem(String name, String email, String image) => SizedBox(
      height: double.infinity,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.red),
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 12.0,
        shadowColor: defaultColor,
        color: defaultColor,
        child: Column(
          children: [
            Container(
                height: 120,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/$image',
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'Web Developer',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            Text(
              email,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
Widget CategoryItem(BuildContext context, double width, double height,
        String? image, String? titleAr, Function function) =>
    Padding(
      padding: const EdgeInsets.all(17.0),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 12.0,
          shadowColor: defaultColor,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(3.0),
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  width: width,
                  height: height,
                  imageUrl: '${image}',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.black54,
                            ),
                            child: Text(
                              '$titleAr',
                              style: GoogleFonts.tajawal(
                                fontSize: 20,
                                color: Colors.white,

                                //backgroundColor: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget DrawerItem(BuildContext context) => Drawer(
      backgroundColor: defaultColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: defaultColor,
            ),
            child: Center(child: Image.asset('assets/images/logo.png')),
          ),
          myDivider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: defaultButton(
              function: () {
                NavigateTo(context, CategoriesScreen());
              },
              text: 'Categories',
              background: Color.fromARGB(255, 239, 91, 36),
              radius: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: defaultButton(
              function: () {
                NavigateTo(context, AboutScreen());
              },
              text: 'About',
              background: Color.fromARGB(255, 239, 91, 36),
              radius: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: defaultButton(
              function: () {
                NavigateTo(context, InstructionsScreen());
              },
              text: 'Instructions',
              background: Color.fromARGB(255, 239, 91, 36),
              radius: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: defaultButton(
              function: () {
                NavigateTo(context, ContactUsScreen());
              },
              text: 'Contact Us',
              background: Color.fromARGB(255, 239, 91, 36),
              radius: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: defaultButton(
              function: () {
                CacheHelper.RemoveData(key: 'token');
                NavigateTo(context, LoginScreen());
              },
              text: 'Logout',
              background: Color.fromARGB(255, 239, 91, 36),
              radius: 8,
            ),
          ),
        ],
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.red,
      ),
    );

void NavigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void NavigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

void showToast({required String message, required ToastStates toastStates}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(toastStates),
        textColor: Colors.white,
        fontSize: 16.0);

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, EROOR, WARNING }
Color chooseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.EROOR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.blue;
      break;
  }
  return color;
}
