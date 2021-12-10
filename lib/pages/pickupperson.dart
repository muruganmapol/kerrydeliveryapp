// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pickupperson extends StatefulWidget {
  const Pickupperson({Key key}) : super(key: key);

  @override
  _PickuppersonState createState() => _PickuppersonState();
}

class _PickuppersonState extends State<Pickupperson> {
  final timeController = TextEditingController();
  final timeController2 = TextEditingController();
  String valuechoose;
  List listItem = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "Pickup Person",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          DataTable(
            horizontalMargin: 0,
            columnSpacing: 80,
            headingRowHeight: 0,
            columns: [
              DataColumn(
                  label: Text('',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(
                  Text(
                    'VECHICLE NAME',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataCell(Text(':')),
                DataCell(
                  Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              DataRow(cells: [
                DataCell(
                  Text(
                    'VECHICLE TYPE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataCell(Text(':')),
                DataCell(
                  Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              DataRow(cells: [
                DataCell(
                  Text(
                    'DRIVER NAME',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataCell(Text(':')),
                DataCell(
                  Text(
                    'Karthick',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              DataRow(cells: [
                DataCell(
                  Text(
                    'DRIVER MOBILE NO',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataCell(Text(':')),
                DataCell(
                  Text(
                    '7654346712',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Container(
              child: TextFormField(
                readOnly: true,
                controller: timeController,
                decoration: InputDecoration(
                  labelText: "GATE OUT TIME",
                  hintText: "gate out time",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(Icons.timelapse),
                ),
                onTap: () async {
                  var time = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  timeController.text = time.format(context);
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Container(
              child: TextFormField(
                readOnly: true,
                controller: timeController2,
                decoration: InputDecoration(
                  labelText: "GATE IN TIME",
                  hintText: "gate in time",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(Icons.timelapse),
                ),
                onTap: () async {
                  var time = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  timeController2.text = time.format(context);
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: "VECHICLE END KM",
                  hintText: "Enter your km",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(Icons.flight_land),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // SizedBox(height: 20),
          // Center(
          //   child: SeparatedRow(
          //     children: <Widget>[
          //       Padding(
          //         padding: const EdgeInsets.only(right: 8.0),
          //         child: new Text('VECHICLE NAME',
          //             textAlign: TextAlign.right,
          //             style: new TextStyle(
          //               color: Color(0xFF2E3233),
          //             )),
          //       ),
          //       new Text('-', style: new TextStyle(color: Color(0xFF2E3233))),
          //       new Text('Lorry', style: new TextStyle(color: Color(0xFF2E3233))),
          //     ],
          //     separatorBuilder: (BuildContext context, int index) {
          //       return Container(
          //         width: 2.0,
          //         height: 2.0,
          //         color: Colors.white,
          //       );
          //     },
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   ),
          // ),
          // Center(
          //   child: SeparatedRow(
          //     children: <Widget>[
          //       Padding(
          //         padding: const EdgeInsets.only(right: 8.0),
          //         child: new Text('VECHICLE TYPE',
          //             textAlign: TextAlign.right,
          //             style: new TextStyle(
          //               color: Color(0xFF2E3233),
          //             )),
          //       ),
          //       new Text('-', style: new TextStyle(color: Color(0xFF2E3233))),
          //       new Text('Lorry', style: new TextStyle(color: Color(0xFF2E3233))),
          //     ],
          //     separatorBuilder: (BuildContext context, int index) {
          //       return Container(
          //         width: 2.0,
          //         height: 2.0,
          //         color: Colors.white,
          //       );
          //     },
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   ),
          // ),
          // Center(
          //   child: SeparatedRow(
          //     children: <Widget>[
          //       Padding(
          //         padding: const EdgeInsets.only(right: 8.0),
          //         child: new Text('DRIVER NAME',
          //             textAlign: TextAlign.right,
          //             style: new TextStyle(
          //               color: Color(0xFF2E3233),
          //             )),
          //       ),
          //       new Text('-', style: new TextStyle(color: Color(0xFF2E3233))),
          //       new Text('karthick',
          //           style: new TextStyle(color: Color(0xFF2E3233))),
          //     ],
          //     separatorBuilder: (BuildContext context, int index) {
          //       return Container(
          //         width: 2.0,
          //         height: 2.0,
          //         color: Colors.white,
          //       );
          //     },
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   ),
          // ),
          // Center(
          //   child: SeparatedRow(
          //     children: <Widget>[
          //       new Text('DRIVER MOBILE NO',
          //           textAlign: TextAlign.right,
          //           style: new TextStyle(
          //             color: Color(0xFF2E3233),
          //           )),
          //       new Text('-', style: new TextStyle(color: Color(0xFF2E3233))),
          //       new Text('7845129632',
          //           style: new TextStyle(color: Color(0xFF2E3233))),
          //     ],
          //     separatorBuilder: (BuildContext context, int index) {
          //       return Container(
          //         width: 2.0,
          //         height: 2.0,
          //         color: Colors.white,
          //       );
          //     },
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   ),
          // ),
          // Table(children: [
          //   TableRow(children: [
          //     Center(
          //       child: Text("Vechicle Name" ),
          //     ),
          //     Center(
          //       child: Text("->"),
          //     ),
          //     Center(
          //       child: Text("Lorry"),
          //     ),
          //   ]),
          //   TableRow(children: [
          //     Center(
          //       child: Text("Vechicle Type"),
          //     ),
          //     Center(
          //       child: Text("->"),
          //     ),
          //     Center(
          //       child: Text("AC23456"),
          //     ),
          //   ]),
          //   TableRow(children: [
          //     Center(
          //       child: Text("Driver Name"),
          //     ),
          //     Center(
          //       child: Text("->"),
          //     ),
          //     Center(
          //       child: Text("Karthick"),
          //     ),
          //   ]),
          //   TableRow(children: [
          //     Center(
          //       child: Text("Driver Mobile no"),
          //     ),
          //     Center(
          //       child: Text("->"),
          //     ),
          //     Center(
          //       child: Text("7894125632"),
          //     ),
          //   ]),
          // ]),
          Center(
            child: new Table(
              children: const <TableRow>[
                TableRow(
                  children: <Widget>[
                    Center(child: Text('AAAAAA')),
                    Center(child: Text('B')),
                    Center(child: Text('C')),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Center(child: Text('BBBB')),
                    Center(child: Text('AAAAAA')),
                    Center(child: Text('vdsvsdvs')),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Center(child: Text('CCCCCC')),
                    Center(child: Text('F')),
                    Center(child: Text('CG')),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: Text('Save'),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
