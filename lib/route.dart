import 'package:flutter/widgets.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fml/pages/consignmentupdatescreen.dart';
import 'package:fml/pages/gcnnumber.dart';
import 'package:fml/pages/login.dart';
import 'package:fml/pages/otpscreen.dart';
import 'package:fml/pages/runsheetlist.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const Login(),
  '/otpscreen': (context) => const Otpscreen(number: '',),
  '/runsheetlist': (context) => const Runsheetlist(),
  '/gcnnumber': (context) => const Gcnnumber(),
  '/consignmentupdatescreen': (context) => const Consignmentupdatescreen(),
};
