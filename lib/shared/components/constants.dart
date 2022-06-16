// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/network/local/cache_helper.dart';

void SignOut(context) {
  CacheHelper.RemoveData(key: 'token').then((value) {
    if (value) {
      NavigateAndFinish(context, LoginScreen());
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element) => print(element.group(0)));
}

String? TOKEN = '';
String TITLE = '';
String USERID = '';
String PRODUCTID = '';
