import 'package:flutter/material.dart';
import 'package:fml/pages/otpscreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "Kerry Indev Delivery",
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
                    width: 300,
                    height: 200,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/logokerry.png')),
              ),
            ),

            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: Colors.black38,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    hintText: 'Enter phone number'),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Otpscreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900], // background
                ),
                child: const Text(
                  'Send',
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
}
