import 'package:flutter/widgets.dart';
import 'package:fml/pages/login.dart';
import 'package:fml/pages/otpscreen.dart';
import 'package:fml/pages/runsheetlist.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const Login(),
  '/otpscreen': (context) => const Otpscreen(),
  '/runsheetlist': (context) => const Runsheetlist(),
};
