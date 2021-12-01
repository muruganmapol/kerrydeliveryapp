import 'package:flutter/material.dart';
import 'package:fml/pages/consignmentupdatescreen.dart';

class Gcnnumber extends StatefulWidget {
  const Gcnnumber({Key? key}) : super(key: key);

  @override
  _GcnnumberState createState() => _GcnnumberState();
}

class _GcnnumberState extends State<Gcnnumber> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "GCN Number",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.orange[50],
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Consignmentupdatescreen()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Text(
                                      'raj',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                    ),
                                    SizedBox(width: 15),
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.2,
                                              0.4,
                                            ],
                                            colors: <Color>[
                                              Colors.blue[500]!,
                                              Colors.blue[700]!,
                                            ],
                                          ),
                                          color: Colors.blue[900],
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          'Confirm',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Container(
                                      // margin: const EdgeInsets.only(left: 100),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.2,
                                              0.4,
                                            ],
                                            colors: <Color>[
                                              Colors.orange[800]!,
                                              Colors.orange[600]!,
                                            ], // r
                                          ),
                                          color: Colors.blue[900],
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          'D',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Text(
                                    "Consignee : ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "Address : ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "Pincode : ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "Mobile No : ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}
