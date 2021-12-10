// @dart=2.9
import 'package:flutter/material.dart';
import 'package:fml/pages/pickupgcninvoiceform.dart';
import 'package:fml/pages/pickupperson.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import 'ListFieldsForm.dart';

class Pickupgcnform extends StatefulWidget {
  const Pickupgcnform({Key key}) : super(key: key);

  @override
  _PickupgcnformState createState() => _PickupgcnformState();
}

class _PickupgcnformState extends State<Pickupgcnform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "Pickup GCN Form",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListFieldsForm(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[900], // background
              onPrimary: Color.fromARGB(255, 255, 255, 255), // foreground
            ),
            onPressed: () {},
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
