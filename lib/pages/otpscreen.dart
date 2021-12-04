// ignore_for_file: non_constant_identifier_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fml/model/runsheetdata_model.dart';
import 'package:fml/pages/runsheetlist.dart';
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
    return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 238, 126, 61),
            centerTitle: true,
            title: const Text(
              "OTP",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
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
                  borderColor: const Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },

                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    setState(() {
                      otp_value = verificationCode;
                    });
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            resendotp();
                          },
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      verifyotp();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900], // background
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
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

  void verifyotp() async {
    print(otp_value);
    var url =
        Uri.parse("http://182.72.177.132/backend/public/api/getrunsheetotp");
    Response response = await post(
      url,
      body: json.encode({"phone_no": widget.number, "otp": otp_value}),
      headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
    );
    print(response.body);
    await FlutterSession().set("phone_number", widget.number);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Runsheetlist(),
          settings: RouteSettings(
              arguments:
                  User(runsheetnos: json.decode(response.body), gcndata: [])),
        ),
      );
    } else {
      showAlertDialog(context);
    }
  }

  void resendotp() async {
    print(widget.number);
    var url = Uri.parse("http://182.72.177.132/backend/public/api/getrunsheet");
    Response response = await post(
      url,
      body: json.encode({
        "phone_no": widget.number,
      }),
      headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
    );
  }
}
