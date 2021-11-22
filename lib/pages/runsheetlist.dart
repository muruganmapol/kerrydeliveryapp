import 'package:flutter/material.dart';

class Runsheetlist extends StatefulWidget {
  const Runsheetlist({Key? key}) : super(key: key);

  @override
  _RunsheetlistState createState() => _RunsheetlistState();
}

class _RunsheetlistState extends State<Runsheetlist> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "Runsheet List",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                    labelText: 'OTP',
                    hintText: 'Enter OTP number'),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900], // background
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 22),
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
