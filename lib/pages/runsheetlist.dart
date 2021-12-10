import 'package:flutter/material.dart';
import 'package:fml/pages/pickuform.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 241, 241, 241),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.blue[900],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Pickupform()),
                    );
                  },
                  title: Text("RunSheet1"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 241, 241, 241),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.blue[900],
                  ),
                  title: Text("RunSheet1"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 241, 241, 241),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.blue[900],
                  ),
                  title: Text("RunSheet1"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
