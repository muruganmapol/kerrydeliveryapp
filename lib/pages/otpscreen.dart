import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fml/pages/pickuform.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Otpscreen extends StatefulWidget {
  final String number;
  const Otpscreen({Key? key, required this.number}) : super(key: key);

  _OtpscreenState createState() => _OtpscreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String otp_value = '';

@override
class _OtpscreenState extends State<Otpscreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "OTP",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Center(
              child: SizedBox(
                  width: 120,
                  height: 120,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  child: Image.asset('assets/images/otp.png')),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Verification Code',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const Text(
            'Please enter the OTP sent to your device',
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          const SizedBox(
            height: 30,
          ),
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  });
            }, // end onSubmit
          ),
          SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              text: 'Didnot receive the code? ',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'RESEND',
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        _formKey.currentState!.reset();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: const Text("OTP invalied !"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
