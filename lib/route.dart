import 'package:flutter/widgets.dart';

import 'package:fml/pages/pickuform.dart';
import 'package:fml/pages/login.dart';
import 'package:fml/pages/otpscreen.dart';
import 'package:fml/pages/pickupgcnform.dart';
import 'package:fml/pages/pickupgcninvoiceform.dart';
import 'package:fml/pages/pickupgcnname.dart';
import 'package:fml/pages/runsheetlist.dart';
import 'package:fml/pages/pickupperson.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const Login(),
  '/otpscreen': (context) => const Otpscreen(),
  '/runsheetlist': (context) => const Runsheetlist(),
  '/pickupform': (context) => const Pickupform(),
  '/pickupperson': (context) => const Pickupperson(),
  '/pickupgcnscreen': (context) => const Pickupgcnname(),
  '/pickupgcnform': (context) => const Pickupgcnform(),
  '/pickupgcninvoiceform': (context) => const Pickupgcninvoiceform(),
};
