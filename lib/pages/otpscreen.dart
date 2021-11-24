import 'package:flutter/material.dart';
import 'package:fml/pages/runsheetlist.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Otpscreen extends StatefulWidget {
  const Otpscreen({Key? key}) : super(key: key);

  @override
  _OtpscreenState createState() => _OtpscreenState();
}

var otpdata = myController.text;


  final myController = TextEditingController();

class _OtpscreenState extends State<Otpscreen> {
  Widget build(BuildContext context) {
    return Scaffold(
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
                showDialog(
                  barrierLabel: myController.text = verificationCode,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            

            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
            // SizedBox(
            //   height: 130,
            // ),
            // Text('New User? Create Account')
          ],
        ),
      ),
    );
  }

  void verifyotp() async {
print(otpdata);
    var url = Uri.parse("http://182.72.177.132/backend/public/api/getrunsheetotp");
    Response response = await post(
       url,
        body: json.encode({
          "phone_no": '9245262418',
          "otp" : otpdata
        }),
        headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
      );
      
      print(response.body);
      if (response.statusCode==200) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Runsheetlist()),
                  );
      }else{
        print("ERROR");
      }
  }
}
