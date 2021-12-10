import 'package:flutter/material.dart';
import 'package:fml/pages/login.dart';
import 'package:fml/pages/pickupgcnname.dart';
import 'package:fml/pages/pickupperson.dart';

class Pickupform extends StatefulWidget {
  const Pickupform({Key? key}) : super(key: key);

  @override
  _PickupformState createState() => _PickupformState();
}

class _PickupformState extends State<Pickupform> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: Text('Pickup Form'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
          icon: Icon(Icons.home),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.arrow_back),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                  color: Colors.orange[50],
                  child: ListTile(
                    title: Text("Pickup:"),
                    subtitle: Text(
                      'Total GCN:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.local_shipping,
                            size: 25.0,
                            color: Colors.blue[900],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Pickupperson()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.wifi,
                            size: 25.0,
                            color: Colors.orange[900],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Pickupgcnname()),
                            );
                          },
                        ),
                      ],
                    ),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.orange[50],
                  child: ListTile(
                    title: Text("Pickup Name:"),
                    subtitle: Text(
                      'Total GCN:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.local_shipping,
                            size: 25.0,
                            color: Colors.blue[900],
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.wifi,
                            size: 25.0,
                            color: Colors.orange[900],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.orange[50],
                  child: ListTile(
                    title: Text("Pickup Name:"),
                    subtitle: Text(
                      'Total GCN:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.local_shipping,
                            size: 25.0,
                            color: Colors.blue[900],
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.wifi,
                            size: 25.0,
                            color: Colors.orange[900],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.orange[50],
                  child: ListTile(
                    title: Text("Pickup Name:"),
                    subtitle: Text(
                      'Total GCN:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.local_shipping,
                            size: 25.0,
                            color: Colors.blue[900],
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.wifi,
                            size: 25.0,
                            color: Colors.orange[900],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.orange[50],
                  child: ListTile(
                    title: Text("Pickup Name:"),
                    subtitle: Text(
                      'Total GCN:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.local_shipping,
                            size: 25.0,
                            color: Colors.blue[900],
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.wifi,
                            size: 25.0,
                            color: Colors.orange[900],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.orange[50],
                  child: ListTile(
                    title: Text("Pickup Name:"),
                    subtitle: Text(
                      'Total GCN:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.local_shipping,
                            size: 25.0,
                            color: Colors.blue[900],
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.wifi,
                            size: 25.0,
                            color: Colors.orange[900],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.orange[50],
                  child: ListTile(
                    title: Text("Pickup Name:"),
                    subtitle: Text(
                      'Total GCN:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.local_shipping,
                            size: 25.0,
                            color: Colors.blue[900],
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.wifi,
                            size: 25.0,
                            color: Colors.orange[900],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     child: Card(
            //       color: Colors.orange[50],
            //       clipBehavior: Clip.antiAlias,
            //       child: Column(
            //         children: [
            //           ListTile(
            //             title: const Text('Pickup Name:'),
            //             subtitle: Text(
            //               'RNNN01245789652',
            //               style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            //             ),
            //           ),
            //           ButtonBar(
            //             alignment: MainAxisAlignment.center,
            //             children: [
            //               Row(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: ElevatedButton(
            //                       onPressed: () {
            //                         Navigator.pushNamed(
            //                             context, VehicleUpdateScreen.routeName);
            //                       },
            //                       style: ElevatedButton.styleFrom(
            //                         primary: Colors.blue[900], // background
            //                         // foreground
            //                       ),
            //                       child: Text('Vechicle update'),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: ElevatedButton(
            //                       onPressed: () {
            //                         Navigator.pushNamed(
            //                             context, GcnnumberScreen.routeName);
            //                         // Respond to button press
            //                       },
            //                       style: ElevatedButton.styleFrom(
            //                         primary: Colors.orange[900], // background
            //                         // foreground
            //                       ),
            //                       child: Text('Consignment Update'),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
